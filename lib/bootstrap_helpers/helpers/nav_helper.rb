# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module NavHelper
      def nav(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        nav = BootstrapHelpers::Nav.new(self)
        bs_render template: 'nav/nav', block: block, options: options, klass: nav
      end
    end
  end
end
