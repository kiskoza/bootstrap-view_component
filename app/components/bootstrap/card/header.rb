# frozen_string_literal: true

module Bootstrap
  class Card
    class Header < Bootstrap::BaseComponent
      def initialize(text: nil, **args)
        super(**args)

        @text = text
      end

      def render?
        text || content
      end

      def call
        content_tag :div, class: "card-header #{class_names}" do
          text ? concat(text) : content
        end
      end

      private

      attr_reader :text
    end
  end
end
