# frozen_string_literal: true

module Bootstrap
  class ListGroup < Bootstrap::BaseComponent
    renders_many :items, Bootstrap::ListGroup::Item

    def call
      super do
        content_tag :ul, class: "list-group #{class_names}" do
          content || items.each do |item|
            concat(item)
          end
        end
      end
    end
  end
end
