# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module DefinitionListHelper
      def dl(split: 6, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        list = BootstrapHelpers::DefinitionList.new(self, split: split)
        bs_render template: 'definition_list/dl', block: block, options: { split: split }, klass: list
      end
    end
  end
end
