module BootstrapHelpers
  class Card  < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def card
    end

    def header(text, options = {}, &block)
      bs_render template: 'card/header', options: options, locals: { text: text }, block: block
    end

    def body(options = {}, &block)
      bs_render template: 'card/body', options: options, block: block
    end
  end
end
