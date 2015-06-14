require 'test_helper'

require 'generators/grape/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GrapeApiGenerator::TestHelper

  tests ::Grape::InstallGenerator
  destination File.expand_path("../../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  setup :copy_routes

  test "modify application config" do
    run_generator %w(my_app)
    assert_file "config/application.rb", %r(config.paths.add File.join\('app', 'api'\))
    assert_file "config/application.rb", %r(config.autoload_paths \+= Dir\[Rails.root.join\('app', 'api', '\*'\)\])
  end

  test "generate base api file" do
    run_generator %w(my_app)
    assert_file "app/api/my_app/api.rb", /module MyApp/
    assert_file "app/api/my_app/api.rb", /class API < Grape::API/
  end

  test "generate version api files" do
    run_generator %w(my_app)
    assert_file "app/api/my_app/v1.rb", /class V1 < MyApp::API/

    run_generator %w(my_app --version 2)
    assert_file "app/api/my_app/v2.rb", /class V2 < MyApp::API/
  end

  test "generate api helper file" do
    run_generator %w(my_app)
    assert_file "app/api/my_app/api_helpers.rb", /module ApiHelpers/
    assert_file "app/api/my_app/api.rb", /helpers MyApp::ApiHelpers/
  end

  test "add route for api" do
    run_generator %w(my_app)
    assert_file "config/routes.rb", %r(mount MyApp::V1 => '/')
  end

  test "use correct authentication model" do
    run_generator %w(my_app --model_name customer)
    assert_file "app/api/my_app/api_helpers.rb", /def current_customer/
  end
end
