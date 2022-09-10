# frozen_string_literal: true

module Bootstrap
  class Card
    class Body < Bootstrap::BaseComponent
      renders_one :text, Bootstrap::ContentTag
      renders_one :title, Bootstrap::ContentTag
      renders_one :subtitle, Bootstrap::ContentTag

      def render?
        text || title || subtitle || content
      end

      def before_render
        if title
          title.tag ||= :h4
          title.class_names = ['card-title', *title.class_names]
        end

        if text
          text.tag ||= :p
          text.class_names = ['card-text', *text.class_names]
        end

        if subtitle
          subtitle.tag ||= :h6
          subtitle.class_names = ['card-subtitle', *subtitle.class_names]
        end
      end

      def call
        content_tag :div, class: "card-body #{class_names}" do
          concat(title)
          concat(subtitle)
          concat(text)
          concat(content)
        end
      end
    end
  end
end
