# frozen_string_literal: true

module Bootstrap
  class ListGroup < Bootstrap::BaseComponent
    renders_many :items, Bootstrap::ListGroup::Item

    def call
      content_tag :ul, class: "list-group #{class_names}" do
        items.each do |item|
          concat(item)
        end
      end
    end
  end
end
