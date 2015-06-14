module <%= vendor.classify %>
  module Entities
    class <%= resource.classify %> < <%= vendor.classify %>::Entities::Base
      expose :id
<% attributes_names.each do |name| %>      expose :<%= name %>
<% end %>
      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end
