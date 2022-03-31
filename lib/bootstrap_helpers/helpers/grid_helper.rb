# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module GridHelper
      def row(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        grid = BootstrapHelpers::Grid.new(self)
        bs_render template: 'grid/row', block: block, options: options, klass: grid
      end

      def col(options = {}, &block)
        # col is not always used inside a row
        grid = BootstrapHelpers::Grid.new(self)
        bs_render template: 'grid/column', block: block, klass: grid, options: options
      end
    end
  end
end
