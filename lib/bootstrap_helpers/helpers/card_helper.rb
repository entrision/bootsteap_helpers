# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module CardHelper
      def card(header = nil, options = {}, &block)

        unless block.nil?
          options.merge! header if header.is_a? Hash
        end

        card = BootstrapHelpers::Card.new(self)
        bs_render template: 'card/card', klass: card, block: block, options: options, locals: { header: header }
      end
    end
  end
end
