# frozen_string_literal: true

module Bootstrap
  class Navbar
    class Item < Bootstrap::BaseComponent
      renders_one :dropdown, Bootstrap::Dropdown

      attr_accessor :background
      attr_accessor :theme

      def initialize(link: '#', active: false, text: nil, **args)
        super(**args)

        @active = active
        @link = link
        @text = text
      end

      def render?
        text || content
      end

      def before_render
        return unless dropdown

        dropdown.id = dropdown_id
        dropdown.theme ||= theme
      end

      def call
        if dropdown
          content_tag :li, class: "nav-item dropdown #{class_names}" do
            concat link_to(text || content,
                           '#',
                           class: 'nav-link dropdown-toggle',
                           id: dropdown_id,
                           role: 'button',
                           'data-bs-toggle': 'dropdown',
                           'aria-expand': false)
            concat dropdown
          end
        else
          content_tag :li, class: "nav-item #{class_names}" do
            link_to link, class: "nav-link #{active ? 'active' : ''}" do
              text ? concat(text) : content
            end
          end
        end
      end

      private

      def dropdown_id
        @dropdown_id ||= "bs_navbar_item_dropdown_#{object_id}"
      end

      attr_reader :active
      attr_reader :link
      attr_reader :text
    end
  end
end
