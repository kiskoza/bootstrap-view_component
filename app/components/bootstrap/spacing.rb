# frozen_string_literal: true

require 'bootstrap/view_component/spacing/property'
require 'bootstrap/view_component/spacing/sides'

module Bootstrap
  class Spacing < Bootstrap::BaseComponent
    def initialize(property:, size:, sides: :all, breakpoint: nil, **args)
      super(**args)

      @property = Bootstrap::ViewComponent::Spacing::Property.new(property)
      @sides = Bootstrap::ViewComponent::Spacing::Sides.new(sides)
      @size = size
      @breakpoint = breakpoint
    end

    def call
      super do
        content_tag :div, class: "#{property}#{sides}#{breakpoint}-#{size} #{class_names}" do
          content
        end
      end
    end

    private

    attr_reader :property
    attr_reader :sides
    attr_reader :size
    attr_reader :breakpoint
  end
end
