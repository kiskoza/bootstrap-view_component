# frozen_string_literal: true

module Bootstrap
  module ViewComponent
    class Config
      attr_accessor :theme

      def initialize
        @theme = 'light'
      end
    end
  end
end
