# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ModalHelper
      def small_modal(modal_id, title, options = {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        modal = BootstrapHelpers::Modal.new(self)
        modal.small_modal(modal_id, title, options, &block)
      end

      def large_modal(modal_id, title, options: {}, &block)
        raise ArgumentError, 'Missing block' unless block_given?

        modal = BootstrapHelpers::Modal.new(self)
        modal.large_modal(modal_id, title, options, &block)
      end
    end
  end
end
