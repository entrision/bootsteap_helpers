# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module AlertHelper
      def alert_message(text = '', level: 'warning', header: nil, icon: true, dismissible: true, &block)
        alert = BootstrapHelpers::Alert.new(self)
        icon = alert.generate_icon(icon, level)
        icon = nil unless block.nil?
        content = capture(alert, &block) unless block.nil?
        bs_render template: 'alert/alert', content: content, locals: { icon: icon, dismissible: dismissible, level: level, header: header, content: content, text: text }
      end

      def flash_messages
        bs_render template: 'alert/flash', locals: {}
      end
    end
  end
end
