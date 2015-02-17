source "https://rubygems.org"

# There is an issue with versions of beaker > 2.2.0 and one of the following:
#   - the logic used to modify sshd_config on vagrant boxes to permit root logins
#   - vagrant versions < 1.7.0
#
# While I figure out which, I'm just pinning beaker to 2.2.0, which works with
# vagrant 1.6.5 and the puppetlabs vagrant boxes.
gem "beaker", "2.2.0"
gem "beaker-rspec", "~> 4.0.0"
gem "rake", "~> 10.4.2"
gem "vagrant-wrapper", "~> 2.0.1"
