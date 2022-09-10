# frozen_string_literal: true

module Bootstrap
  class BaseComponent < ViewComponent::Base
    attr_writer :class_names

    def initialize(class_names: nil)
      super

      @class_names = class_names ? [*class_names] : nil
    end

    def class_names
      @class_names&.join(' ')
    end
  end
end
