# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module AccordionHelper
      def accordion(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        accordion = BootstrapHelpers::Accordion.new(self, options)
        bs_render template: 'accordion/accordion', block: block, options: options, klass: accordion
      end
    end
  end
end
