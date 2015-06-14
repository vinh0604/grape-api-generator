module Grape
  class InstallGenerator < Rails::Generators::Base
    argument :vendor, required: true, desc: 'The API vendor name'

    class_option :version, type: :string, default: '1', description: "API version"
    class_option :model_name, type: :string, default: 'user', description: "Authentication model name"

    source_root File.expand_path("../templates", __FILE__)

    def create_base_api
      template "api/api.rb",
               "app/api/#{vendor}/api.rb"
    end

    def create_version_api
      template "api/version.rb",
               "app/api/#{vendor}/#{version}.rb"
    end

    def create_api_helper
      template "api/api_helpers.rb",
               "app/api/#{vendor}/api_helpers.rb"
    end

    def add_route_entry
      route "mount #{vendor.classify}::#{version.upcase} => '/'"
    end

    def version
      @version ||= version_valid? ? "v#{options.version}" : "v1"
    end

    def model_name
      options.model_name.parameterize
    end

    private

    def version_valid?
      options.version.to_i > 0
    end
  end
end
