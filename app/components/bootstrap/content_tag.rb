# frozen_string_literal: true

module Bootstrap
  class ContentTag < ViewComponent::Base
    attr_accessor :tag
    attr_accessor :classes
    attr_accessor :text

    def initialize(tag: nil, classes: nil, text: nil)
      super

      @tag = tag
      @classes = classes ? [*classes].join(' ') : nil
      @text = text
    end

    def render?
      text || content
    end

    def call
      content_tag(tag || :div, class: classes || '') do
        text ? concat(text) : content
      end
    end
  end
end
