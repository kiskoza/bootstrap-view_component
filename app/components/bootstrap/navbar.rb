# frozen_string_literal: true

module Bootstrap
  class Navbar < Bootstrap::BaseComponent
    renders_one :brand, Bootstrap::Navbar::Brand
    renders_many :items, Bootstrap::Navbar::Item

    def initialize(expand: 'lg', theme: nil, background: nil, **args)
      super(**args)

      @expand = expand
      @theme = theme
      @background = background
    end

    def before_render
      items.each do |item|
        item.theme ||= theme
      end
    end

    def call
      content_tag :nav, class: "navbar navbar-expand-#{expand} navbar-#{theme} bg-#{background} #{class_names}" do
        content_tag :div, class: 'container-fluid' do
          concat brand
          concat(
            content_tag(:button,
                        class: 'navbar-toggler',
                        type: 'button',
                        'data-bs-toggle': 'collapse',
                        'data-bs-target': "##{collapse_id}",
                        'aria-controls': 'navbarSupportedContent',
                        'aria-expanded': 'false',
                        'aria-label': 'Toggle navigation') do
              content_tag :span, '', class: 'navbar-toggler-icon'
            end
          )
          concat(
            content_tag(:div, class: 'collapse navbar-collapse', id: collapse_id) do
              content_tag :ul, class: 'navbar-nav me-auto mb-2 mb-lg-0' do
                items.each do |item|
                  concat(item)
                end
              end
            end
          )
          concat content
        end
      end
    end

    def theme
      @theme || Bootstrap::ViewComponent.config.theme
    end

    def background
      @background || theme
    end

    private

    attr_reader :expand

    def collapse_id
      @collapse_id ||= "bs_navbar_collapse_#{object_id}"
    end
  end
end
