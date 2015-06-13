module <%= vendor.classify %>
  class <%= version.upcase %> < <%= vendor.classify %>::API
    version "<%= version %>", using: :path
    prefix :api

    get do
      { version: "<%= version %>" }
    end

    add_swagger_documentation hide_format: true, api_version: "api/<%= version %>"
  end
end
