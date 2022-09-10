# frozen_string_literal: true

module Bootstrap
  class Card < Bootstrap::BaseComponent
    renders_one :header, Bootstrap::Card::Header
    renders_one :body, Bootstrap::Card::Body

    def call
      content_tag :div, class: "card #{class_names}" do
        concat header
        concat body
        concat content
      end
    end
  end
end
