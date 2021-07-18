# frozen_string_literal: true

module Bootstrap
  class Container < ViewComponent::Base
    renders_many :rows, Bootstrap::Grid::Row

    def initialize(fluid: false, breakpoint: nil)
      super

      @fluid = fluid
      @breakpoint = breakpoint
    end

    def call
      content_tag :div, class: modifier ? "container-#{modifier}" : 'container' do
        rows.each do |row|
          concat row
        end
      end
    end

    def modifier
      if @fluid
        'fluid'
      elsif @breakpoint
        @breakpoint
      end
    end
  end
end
