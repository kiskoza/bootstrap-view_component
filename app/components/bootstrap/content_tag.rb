# frozen_string_literal: true

module Bootstrap
  class ContentTag < Bootstrap::BaseComponent
    attr_accessor :tag
    attr_accessor :text

    def initialize(tag: nil, text: nil, **args)
      super(**args)

      @tag = tag
      @text = text
    end

    def render?
      text || content
    end

    def call
      super do
        content_tag(tag || :div, class: class_names.to_s) do
          content || concat(text)
        end
      end
    end
  end
end
