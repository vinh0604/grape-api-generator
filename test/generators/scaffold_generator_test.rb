require 'test_helper'

require 'generators/grape/scaffold_generator'

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  tests ::Grape::ScaffoldGenerator
  destination File.expand_path("../../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "generate api file" do
    run_generator %w(my_app user)
    assert_file "app/api/my_app/user_api.rb", /module MyApp/
    assert_file "app/api/my_app/user_api.rb", /class UserAPI < MyApp::API/
  end

  test "generate base api entity file" do
    run_generator %w(my_app user)
    assert_file "app/api/my_app/entities/base.rb", /module Entities/
    assert_file "app/api/my_app/entities/base.rb", /class Base < Grape::Entity/
  end

  test "generate resource entity file" do
    run_generator %w(my_app user)
    assert_file "app/api/my_app/entities/user.rb", /module Entities/
    assert_file "app/api/my_app/entities/user.rb", /class User < MyApp::Entities::Base/
  end

  test "expose provided attributes in resource entity" do
    run_generator %w(my_app user first_name last_name)
    assert_file "app/api/my_app/entities/user.rb", /expose :first_name/
    assert_file "app/api/my_app/entities/user.rb", /expose :last_name/
  end

  test "add get action to get all resources" do
    run_generator %w(my_app user)
    assert_file "app/api/my_app/user_api.rb", /resource :users do/
    assert_file "app/api/my_app/user_api.rb", /get do/
  end

  test "add post action to create resource" do
    run_generator %w(my_app user first_name:string:r birthdate:date_time)
    assert_file "app/api/my_app/user_api.rb", /post do/
    assert_file "app/api/my_app/user_api.rb", /requires :first_name, type: String/
    assert_file "app/api/my_app/user_api.rb", /optional :birthdate, type: DateTime/
  end

  test "add put action to update resource" do
    run_generator %w(my_app user first_name:string:r birthdate:datetime)
    assert_file "app/api/my_app/user_api.rb", /put ":id" do/
  end
end
