require 'test_helper'

require 'generators/rspec/grape_scaffold_generator'

class RspecScaffoldGeneratorTest < Rails::Generators::TestCase
  tests ::Rspec::Generators::GrapeScaffoldGenerator
  destination File.expand_path("../../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "generate spec file" do
    run_generator %w(my_app user)
    assert_file "spec/api/my_app/user_api_spec.rb", /describe MyApp::UserAPI/
  end
end
