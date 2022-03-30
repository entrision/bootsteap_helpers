# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module GridHelper
      def row(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        grid = BootstrapHelpers::Grid.new(self)
        options = BootstrapHelpers::Options.new(options)
        content = capture(grid, &block)
        bs_render template: 'grid/row', content: content, locals: { options: options }
      end

      def col(options = {}, &block)
        # col is not always used inside a row
        grid = BootstrapHelpers::Grid.new(self)
        options = BootstrapHelpers::Options.new(options)
        content = capture(grid, &block)
        bs_render template: 'grid/column', content: content, locals: { options: options, content: content }
      end
    end
  end
end
