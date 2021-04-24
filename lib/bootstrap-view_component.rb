require 'view_component/engine'

require 'bootstrap/view_component/config'
require 'bootstrap/view_component/engine'
require 'bootstrap/view_component/base'

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
