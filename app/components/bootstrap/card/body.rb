# frozen_string_literal: true

module Bootstrap
  class Card
    class Body < ViewComponent::Base
      renders_one :text, Bootstrap::ContentTag
      renders_one :title, Bootstrap::ContentTag

      def render?
        text || title || content
      end

      def before_render
        if title
          title.tag ||= :h4
          title.classes = ['card-title', *title.classes]
        end

        if text
          text.tag ||= :p
          text.classes = ['card-text', *text.classes]
        end
      end

      def call
        content_tag :div, class: 'card-body' do
          concat(title)
          concat(text)
          concat(content)
        end
      end
    end
  end
end
