# frozen_string_literal: true

module Bootstrap
  class Card < Bootstrap::BaseComponent
    renders_one :header, Bootstrap::Card::Header
    renders_one :body, Bootstrap::Card::Body

    def call
      super do
        content_tag :div, class: "card #{class_names}" do
          if content
            content
          else
            concat header
            concat body
          end
        end
      end
    end
  end
end
