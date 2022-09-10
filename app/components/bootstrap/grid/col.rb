# frozen_string_literal: true

module Bootstrap
  module Grid
    class Col < ViewComponent::Base
      attr_accessor :offset
      attr_accessor :width

      def initialize(width: nil, offset: nil)
        super

        @offset = offset
        @width = width
      end

      def call
        content_tag :div, class: "col #{width_modifier} #{offset_modifier}" do
          content
        end
      end

      private

      def offset_modifier
        offset ? "offset-#{offset}" : ''
      end

      def width_modifier
        width ? "col-#{width}" : ''
      end
    end
  end
end
