# frozen_string_literal: true

module Bootstrap
  module ViewComponent
    module Spacing
      class Sides
        SIDES = {
          top: 't',
          bottom: 'b',
          start: 's',
          end: 'e',
          horizontal: 'x',
          vertical: 'y',
          all: ''
        }.freeze

        class << self
          def from(value)
            return value if value.is_a?(Sides)

            new(value)
          end

          def all
            @all ||= SIDES.map { |name, _value| new(name) }
          end
        end

        attr_reader :sides

        def to_s
          SIDES[sides].to_s
        end

        protected

        def initialize(sides)
          @sides = sides.to_sym
        end
      end
    end
  end
end
