# frozen_string_literal: true

module Bootstrap
  class BaseComponent < ViewComponent::Base
    attr_accessor :turbo
    attr_writer :class_names

    def initialize(class_names: nil, turbo: nil)
      super

      @class_names = class_names ? [*class_names] : nil
      @turbo = turbo
    end

    def class_names
      @class_names&.join(' ')
    end

    def call(&block)
      if turbo
        concat(tag.turbo_frame(**turbo, &block))
      else
        yield
      end
    end
  end
end
