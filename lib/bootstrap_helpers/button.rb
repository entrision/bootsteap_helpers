module BootstrapHelpers
  class Button < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def icon(name)

    end
  end
end
