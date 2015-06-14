module <%= vendor.classify %>
  class <%= resource.classify %>API < <%= vendor.classify %>::API
    resource :<%= resource.pluralize %> do
      paginate per_page: 20

      get do
        <%= resource.pluralize %> = <%= resource.classify %>.all
        present paginate(<%= resource.pluralize %>), with: <%= vendor.classify %>::Entities::<%= resource.classify %>
      end

      params do
        <%= attributes_params %>
      end
      post do
        <%= resource %> = <%= resource.classify %>.new(permitted_params)

        if <%= resource %>.save
          present <%= resource %>, with: <%= vendor.classify %>::Entities::<%= resource.classify %>
        else
          resource_error!(<%= resource %>)
        end
      end

      params do
        <%= attributes_params %>
      end
      put ":id" do
        <%= resource %> = <%= resource.classify %>.find(params[:id])

        if <%= resource %>.update_attributes(permitted_params)
          present <%= resource %>, with: <%= vendor.classify %>::Entities::<%= resource.classify %>
        else
          resource_error!(<%= resource %>)
        end
      end
    end
  end
end
