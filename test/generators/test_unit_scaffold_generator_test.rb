require 'test_helper'

require 'generators/test_unit/grape/scaffold_generator'

class TestUnitScaffoldGeneratorTest < Rails::Generators::TestCase
  tests ::TestUnit::Generators::Grape::ScaffoldGenerator
  destination File.expand_path("../../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "generate test file" do
    run_generator %w(my_app user)
    assert_file "test/api/my_app/user_api_test.rb", /class UserAPITest < ActionDispatch::IntegrationTest/
  end
end
