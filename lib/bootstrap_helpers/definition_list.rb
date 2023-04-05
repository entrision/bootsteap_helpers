# frozen_string_literal: true

module BootstrapHelpers
  class DefinitionList < BootstrapHelpers::Base

    include ActionView::Helpers::CaptureHelper

    def initialize(view_context, split: 6)
      @ac = view_context
      @split = split || 6
      @left = split
      @right = 12 - split
    end

    def dd(definition, options: {}, &block)
      options.merge!({ size: @left })
      bs_render(template: 'definition_list/definition', options: options, block: block, locals: { definition: definition })
    end

    def dt(term, options: {}, &block)
      options.merge!({ size: @right })
      bs_render(template: 'definition_list/term', options: options, block: block, locals: { term: term })
    end
  end
end
