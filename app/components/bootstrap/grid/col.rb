# frozen_string_literal: true

module Bootstrap
  module Grid
    class Col < ViewComponent::Base
      def call
        content_tag :div, class: 'col' do
          content
        end
      end
    end
  end
end
