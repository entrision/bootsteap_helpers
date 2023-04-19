# frozen_string_literal: true

module BootstrapHelpers
  class Modal < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def small_modal(id, title, options = {}, &block)
      bs_render template: 'modal/small_modal', options: options, locals: { modal_id: id, title: title, options: options }, block: block
    end

    def large_modal(id, title, options = {}, &block)
      bs_render template: 'modal/large_modal', options: options, locals: { modal_id: id, title: title, options: options }, block: block
    end
  end
end
