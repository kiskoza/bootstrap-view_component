# frozen_string_literal: true

require 'bootstrap/view_component/spacing/property'
require 'bootstrap/view_component/spacing/sides'

module Bootstrap
  class Spacing < ViewComponent::Base
    def initialize(property:, size:, sides: :all, breakpoint: nil)
      super

      @property = Bootstrap::ViewComponent::Spacing::Property.new(property)
      @sides = Bootstrap::ViewComponent::Spacing::Sides.new(sides)
      @size = size
      @breakpoint = breakpoint
    end

    def call
      content_tag :div, class: "#{property}#{sides}#{breakpoint}-#{size}" do
        concat content
      end
    end

    private

    attr_reader :property
    attr_reader :sides
    attr_reader :size
    attr_reader :breakpoint
  end
end
