# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module NavBarHelper
      def navbar(css = [], &block)
        raise ArgumentError, 'Missing block' unless block_given?

        navbar = BootstrapHelpers::Navbar.new(self)
        content = capture(navbar, &block)
        bs_render template: 'navbar/navbar', content: content, locals: { classes: css }
      end

      def nav_brand(target:, content: '', css: [], &block)
        target ||= '/'
        bs_render template: 'navbar/brand', locals: { content: content, classes: css, target: target, block: block }
      end

      def navbar_mobile_collapse(options = {}, &block)
        id = options[:id] || SecureRandom.uuid
        bs_render template: 'navbar/mobile_collapse', locals: { id: id, klass: options[:class], block: block }
      end
    end
  end
end
