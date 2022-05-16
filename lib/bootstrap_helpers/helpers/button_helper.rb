# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ButtonHelper
      def bs_link_to(title, url, options = {}, &block)
        title ||= ''
        icon_name = options.delete :icon
        title = nil unless block.blank?
        type = options.delete :type
        type ||= 'warning' if title.downcase.include?('edit') || icon_name&.include?('pencil')
        type ||= 'danger' if title.downcase.include?('delete') || icon_name&.include?('trash')
        type ||= 'info' if title.downcase.include?('eye') || icon_name&.include?('eye')

        button = BootstrapHelpers::Button.new(self)
        bs_render template: 'button/button', klass: button, block: block, options: options, locals: { title: title, url: url, icon_name: icon_name, type: type }
      end
    end
  end
end
