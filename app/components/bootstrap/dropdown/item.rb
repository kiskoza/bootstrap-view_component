# frozen_string_literal: true

module Bootstrap
  class Dropdown
    class Item < Bootstrap::BaseComponent
      def initialize(text: nil, link: '#', **args)
        super(**args)

        @link = link
        @text = text
      end

      def render?
        text || content
      end

      def call
        super do
          content_tag :li do
            link_to link, class: "dropdown-item #{class_names}" do
              content || concat(text)
            end
          end
        end
      end

      private

      attr_reader :link
      attr_reader :text
    end
  end
end
