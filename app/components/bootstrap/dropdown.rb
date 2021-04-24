# frozen_string_literal: true

module Bootstrap
  class Dropdown < ViewComponent::Base
    attr_writer :id
    attr_writer :theme

    renders_many :items, Bootstrap::Dropdown::Item

    def initialize(theme: nil)
      @theme = theme
    end

    def render?
      items.any?
    end

    def call
      content_tag :ul, class: "dropdown-menu dropdown-menu-#{theme}", 'aria-labelledby': id do
        items.each do |item|
          concat item
        end
      end
    end

    def theme
      @theme || 'light'
    end

    private

    attr_reader :id
  end
end
