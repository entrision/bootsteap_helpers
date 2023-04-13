# frozen_string_literal: true

module BootstrapHelpers
  class Accordion < BootstrapHelpers::Base
    include ActionView::Helpers::CaptureHelper

    attr_reader :parent, :first_one, :always_collapse

    def initialize(view_context, options = {})
      @ac = view_context
      @parent = "P#{SecureRandom.uuid}"
      @first_one = 0
      @always_collapse = options[:always_collapse] || false
    end

    def item(title: nil, &block)
      @first_one += 1

      bs_render template: 'accordion/item', locals: { title: title, parent: @parent, first: (@always_collapse ? false : @first_one < 2) }, block: block
    end
  end
end
