module BootstrapHelpers
  class Container < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end
  end
end
