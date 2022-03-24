# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module GridHelper
      def row(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        klass = options[:class] || ''
        klass += ' row'
        grid = BootstrapHelpers::Grid.new(self)
        content = capture(grid, &block)
        bs_render template: 'grid/row', content: content, locals: { classes: klass }
      end

      def col(options = {}, &block)
        # col is not always used inside a row

        grid = BootstrapHelpers::Grid.new(self)
        classes = BootstrapHelpers::Grid.generate_col_classes(options)
        id = options[:id] || SecureRandom.uuid
        content = capture(grid, &block)
        bs_render template: 'grid/column', content: content, locals: { classes: classes, id: id, style: options[:style], content: content }
      end
    end
  end
end
