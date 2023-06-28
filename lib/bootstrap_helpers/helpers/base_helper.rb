# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module BaseHelper
      def bs_render(template:, locals: {}, block: nil, klass: nil, options: {})
        raise ArgumentError, 'template is not formatted correctly, should be section/fragment' if template.split('/').length != 2

        section = template.split('/').first
        fragment = template.split('/').last
        content = capture(klass, &block) unless block.nil?

        options = BootstrapHelpers::Options.new(**options)
        render(partial: "helpers/bootstrap/#{section}/#{fragment}", locals: locals.merge({ content: content, options: options, klass: klass }))
      end
    end
  end
end
