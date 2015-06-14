module <%= vendor.classify %>
  module Entities
    class Base < Grape::Entity
      format_with(:iso_timestamp) { |dt| dt ? dt.iso8601 : nil }
    end
  end
end
