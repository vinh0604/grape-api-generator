module <%= vendor.classify %>
  module ApiHelpers
    extend Grape::API::Helpers

    params :pagination do
      optional :page, type: Integer, default: 1
      optional :per_page, type: Integer, default: 25
    end

    def current_<%= model_name %>
      # Implement your API authentication here
      # @current_<%= model_name %> ||= <%= model_name.classify %>.authenticate!(env)
    end

    def authenticate!
      error!({ error: "401 Unauthorized." }, 401) unless current_<%= model_name %>
    end

    def permitted_params
      declared(params, include_missing: false)
    end
  end
end
