# frozen_string_literal: true

module Bootstrap
  module ViewComponent
    module Spacing
      class Property
        PROPERTIES = {
          margin: 'm',
          padding: 'p'
        }.freeze

        class << self
          def from(value)
            return value if value.is_a?(Property)

            new(value)
          end

          def all
            @all ||= PROPERTIES.map { |name, _value| new(name) }
          end
        end

        attr_reader :property

        def to_s
          PROPERTIES[property].to_s
        end

        protected

        def initialize(property)
          @property = property.to_sym
        end
      end
    end
  end
end
