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
      content_tag :div, class: "#{container} #{class_names}" do
        rows.each do |row|
          concat row
        end
        concat(content)
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
