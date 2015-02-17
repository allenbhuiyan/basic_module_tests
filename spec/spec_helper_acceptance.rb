require 'beaker-rspec'

UNSUPPORTED_PLATFORMS = [ 'windows', 'Solaris' ]

unless ENV['RS_PROVISION'] == 'no'
  hosts.each do |host|
    # Install Puppet
    if host.is_pe?
      install_pe
    else
      # Configure the puppetlabs yum repo
      on host, "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"
      on host, "yum-config-manager --enable puppetlabs"
      on host, "yum-config-manager --enable centosplus"
      # Install the puppet rpm
      install_puppet
      on host, "mkdir -p #{host['distmoduledir']}"
    end
  end
end

RSpec.configure do |c|
  # Project root, module name
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  module_name = 'basic_module_tests'

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    #
    # Use puppet_module_install to scp the module directory from the host into the modulepath on the target VM
    # NOTE: puppet_module_install is defined in beaker-rspec:
    #       https://github.com/puppetlabs/beaker-rspec/blob/master/lib/beaker-rspec/beaker_shim.rb
    puppet_module_install(:source => proj_root, :module_name => module_name)
  end

end
