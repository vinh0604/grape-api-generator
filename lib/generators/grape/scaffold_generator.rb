module Grape
  class ScaffoldGenerator < Rails::Generators::Base
    argument :vendor, required: true, desc: 'The API vendor name'
    argument :resource, required: true, desc: 'The resource API name'
    argument :raw_attributes, required: false, type: :array, desc: 'List of attributes of the resource API'

    source_root File.expand_path("../templates", __FILE__)

    def create_api_file
      template "api/resource_api.rb",
               "app/api/#{vendor}/#{resource}_api.rb"
    end

    def create_base_entity_file
      template "entities/base.rb",
               "app/api/#{vendor}/entities/base.rb"
    end

    def create_resource_entity_file
      template "entities/resource.rb",
               "app/api/#{vendor}/entities/#{resource}.rb"
    end

    def attributes
      @raw_attributes ||= []
      raw_attributes.map do |attr|
        parts = attr.split(':')
        {
          name: parts[0],
          type: (parts[1].presence || 'string').classify,
          required: parts[2] == 'r'
        }
      end
    end

    def attributes_names
      attributes.map { |attr| attr[:name] }
    end

    def attributes_params
      params = attributes.map do |attr|
        line = attr[:required] ? 'requires' : 'optional'
        line += " :#{attr[:name]}"
        line += ", type: #{attr[:type]}"

        line
      end

      params.join("\n        ")
    end

    hook_for :test_framework, as: :grape_scaffold
  end
end
