# frozen_string_literal: true

module Bootstrap
  class Card
    class Header < ViewComponent::Base
      def initialize(text: nil)
        @text = text
      end

      def render?
        text || content
      end

      def call
        content_tag :div, class: 'card-header' do
          text ? concat(text) : content
        end
      end

      private

      attr_reader :text
    end
  end
end