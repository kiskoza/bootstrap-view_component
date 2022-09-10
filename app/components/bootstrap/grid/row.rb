# frozen_string_literal: true

module Bootstrap
  module Grid
    class Row < Bootstrap::BaseComponent
      renders_many :columns, Bootstrap::Grid::Col

      def call
        content_tag :div, class: "row #{class_names}" do
          columns.each do |col|
            concat col
          end
          content
        end
      end
    end
  end
end
