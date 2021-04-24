# frozen_string_literal: true

module Bootstrap
  class Card < ViewComponent::Base
     renders_one :header, Bootstrap::Card::Header

    def call
      content_tag :div, class: 'card' do
        concat header
        concat content
      end
    end
  end
end
