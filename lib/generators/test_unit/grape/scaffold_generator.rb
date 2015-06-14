module TestUnit
  module Generators
    module Grape
      class ScaffoldGenerator < Rails::Generators::Base
        argument :vendor, required: true, desc: 'The API vendor name'
        argument :resource, required: true, desc: 'The resource API name'

        source_root File.expand_path("../templates", __FILE__)

        def create_spec_file
          template "resource_test.rb",
                   "test/api/#{vendor}/#{resource}_api_test.rb"
        end
      end
    end
  end
end
