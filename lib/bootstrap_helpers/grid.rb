# frozen_string_literal: true

module BootstrapHelpers
  class Grid < BootstrapHelpers::Base

    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def col(options = {}, &block)
      bs_render(template: 'grid/column', options: options, block: block) # locals: { classes: classes, id: id, style: options[:style] }, &block)
    end
    alias column col
  end
end
