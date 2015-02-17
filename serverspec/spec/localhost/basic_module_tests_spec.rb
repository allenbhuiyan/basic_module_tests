require 'spec_helper'

# Make assertions about the state of the system after applying the module.
#   1. /tmp/test exists
#   2. /tmp/test is owned by root
#   3. /tmp/test has a group of root
describe file('/tmp/test') do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root') }
end
