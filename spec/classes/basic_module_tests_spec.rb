require 'spec_helper'
describe('basic_module_tests', :type => :class) do

  describe 'when called with no parameters' do

    it {

      should compile

      should contain_file('/tmp/test').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
      })

    }

  end
end
