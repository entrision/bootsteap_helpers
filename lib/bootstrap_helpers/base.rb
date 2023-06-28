# frozen_string_literal: true

module BootstrapHelpers
  class Base
    include ActionView::Helpers::CaptureHelper

    private

    def bs_render(template:, locals: {}, block: nil, klass: nil, options: {})
      raise ArgumentError, 'template is not formatted correctly, should be section/fragment' if template.split('/').length != 2

      section = template.split('/').first
      fragment = template.split('/').last
      options = BootstrapHelpers::Options.new(**options)
      content = @ac.capture(self, &block) unless block.nil?
      @ac.render(partial: "helpers/bootstrap/#{section}/#{fragment}", locals: locals.merge({ content: content, options: options, klass: klass }))
    end
  end
end
