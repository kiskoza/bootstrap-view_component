# frozen_string_literal: true

module Bootstrap
  class ListGroup
    class Item < Bootstrap::BaseComponent
      def initialize(text: nil, action: false, link: '#', **args)
        super(**args)

        @text = text
        @action = action
        @link = link
      end

      def render?
        text || content
      end

      def call
        super do
          if action
            link_to link, class: "list-group-item list-group-item-action #{class_names}" do
              content || concat(text)
            end
          else
            content_tag :li, class: "list-group-item #{class_names}" do
              content || concat(text)
            end
          end
        end
      end

      private

      attr_reader :text
      attr_reader :action
      attr_reader :link
    end
  end
end
