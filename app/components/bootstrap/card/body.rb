# frozen_string_literal: true

module Bootstrap
  class Card
    class Body < ViewComponent::Base
      renders_one :text, Bootstrap::ContentTag
      renders_one :title, Bootstrap::ContentTag
      renders_one :subtitle, Bootstrap::ContentTag

      def render?
        text || title || subtitle || content
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

        if subtitle
          subtitle.tag ||= :h6
          subtitle.classes = ['card-subtitle', *subtitle.classes]
        end
      end

      def call
        content_tag :div, class: 'card-body' do
          concat(title)
          concat(subtitle)
          concat(text)
          concat(content)
        end
      end
    end
  end
end
