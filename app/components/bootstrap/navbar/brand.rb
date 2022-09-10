# frozen_string_literal: true

module Bootstrap
  class Navbar
    class Brand < Bootstrap::BaseComponent
      def initialize(link: '#', text: nil, **args)
        super(**args)

        @link = link
        @text = text
      end

      def render?
        text || content
      end

      def call
        link_to link, class: "navbar-brand #{class_names}" do
          text ? concat(text) : content
        end
      end

      private

      attr_reader :link
      attr_reader :text
    end
  end
end
