$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails/generators/test_case'
require 'minitest/autorun'

module GrapeApiGenerator
  module TestHelper
    def copy_routes
      routes = File.expand_path("../support/routes.rb", __FILE__)
      application = File.expand_path("../support/application.rb", __FILE__)
      destination = File.join(destination_root, "config")
      FileUtils.mkdir_p(destination)
      FileUtils.cp routes, destination
      FileUtils.cp application, destination
    end
  end
end
