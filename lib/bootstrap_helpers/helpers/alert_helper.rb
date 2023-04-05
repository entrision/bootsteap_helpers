# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module AlertHelper
      def alert_message(text = '', options: {}, &block)
        unless block.nil?
          options.merge! text if text.is_a? Hash
          options[:icon] = false
          text = nil
        end
        alert = BootstrapHelpers::Alert.new(self)
        bs_render template: 'alert/alert', klass: alert, block: block, options: options, locals: { text: text }
      end

      def flash_messages
        bs_render template: 'alert/flash', locals: {}
      end
    end
  end
end
