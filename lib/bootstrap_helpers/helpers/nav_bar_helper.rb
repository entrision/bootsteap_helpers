# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module NavBarHelper
      def navbar(options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        navbar = BootstrapHelpers::Navbar.new(self)
        bs_render template: 'navbar/navbar', block: block, options: options, klass: navbar
      end

      def nav_brand(target:, options: {}, &block)
        target ||= '/'
        bs_render template: 'navbar/brand', block: block, options: options, locals: { target: target }
      end

      def navbar_mobile_collapse(options = {}, &block)
        bs_render template: 'navbar/mobile_collapse', options: options, block: block
      end
    end
  end
end
