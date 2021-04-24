require 'view_component/engine'

require_relative 'bootstrap/view_component/config'

module Bootstrap
  module ViewComponent
    def self.config
      @config ||= Bootstrap::ViewComponent::Config.new
    end

    def self.configure
      yield(config) if block_given?
    end
  end
end
