module Rspec
  module Generators
    module Grape
      class ScaffoldGenerator < Rails::Generators::Base
        argument :vendor, required: true, desc: 'The API vendor name'
        argument :resource, required: true, desc: 'The resource API name'

        source_root File.expand_path("../templates", __FILE__)

        def create_spec_file
          template "resource_spec.rb",
                   "spec/api/#{vendor}/#{resource}_api_spec.rb"
        end
      end
    end
  end
end
