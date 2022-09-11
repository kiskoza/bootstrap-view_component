# frozen_string_literal: true

module Bootstrap
  module Grid
    class Col < Bootstrap::BaseComponent
      attr_accessor :offset
      attr_accessor :width

      def initialize(width: nil, offset: nil, **args)
        super(**args)

        @offset = offset
        @width = width
      end

      def call
        super do
          content_tag :div, class: "col #{width_modifier} #{offset_modifier} #{class_names}" do
            content
          end
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
