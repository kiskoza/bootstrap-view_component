# frozen_string_literal: true

module Bootstrap
  module Grid
    class Row < Bootstrap::BaseComponent
      renders_many :columns, Bootstrap::Grid::Col

      def call
        super do
          content_tag :div, class: "row #{class_names}" do
            content || columns.each do |col|
              concat col
            end
          end
        end
      end
    end
  end
end
