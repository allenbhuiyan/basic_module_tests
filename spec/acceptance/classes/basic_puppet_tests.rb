require 'spec_helper_acceptance'

describe "basic_module_test results", :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do

  # Read the manifest containing our test
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))
  manifest_file = "#{module_root}/tests/init.pp"
  manifest = File.open(manifest_file).read

  # Now apply the manifest twice.
  # On the first application, ensure stderr is empty
  describe 'on first application' do
    it 'should have empty stderr' do
      apply_manifest(manifest, :catch_failures => true) do |r|
        expect(r.stderr).to eq("")
      end
    end
  end

  # On the second application, ensure stderr is empty and the exit code is 0 (no changes)
  describe 'on second application' do
    it 'should have empty stderr and zero exit code' do
      apply_manifest(manifest, :catch_failures => true) do |r|
        expect(r.stderr).to eq("")
        expect(r.exit_code).to be_zero
      end
    end
  end
 
  # Now make assertions about the state of the system after applying the module. 
  #   1. /tmp/test exists
  #   2. /tmp/test is owned by root
  #   3. /tmp/test has a group of root
  describe file('/tmp/test') do
    it { should be_file }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
  end

end
