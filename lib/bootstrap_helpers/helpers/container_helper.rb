# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ContainerHelper
      def container(options = {}, &block)
        container = BootstrapHelpers::Container.new(self)
        bs_render template: 'container/container', klass: container, block: block, options: options
      end
    end
  end
end
