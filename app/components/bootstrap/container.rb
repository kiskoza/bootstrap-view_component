# frozen_string_literal: true

module Bootstrap
  class Container < Bootstrap::BaseComponent
    renders_many :rows, Bootstrap::Grid::Row

    def initialize(fluid: false, breakpoint: nil, **args)
      super(**args)

      @fluid = fluid
      @breakpoint = breakpoint
    end

    def call
      super do
        content_tag :div, class: "#{container} #{class_names}" do
          content || rows.each do |row|
            concat row
          end
        end
      end
    end

    def container
      if @fluid
        'contained-fluid'
      elsif @breakpoint
        "container-#{@breakpoint}"
      else
        'container'
      end
    end
  end
end
