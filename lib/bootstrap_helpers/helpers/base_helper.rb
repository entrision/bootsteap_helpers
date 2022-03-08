# frozen_string_literal: true

module Bootstrap
  module BaseHelper
    def bs_render(template:, locals: {}, content: nil, &block)
      raise ArgumentError, 'template is not formatted correctly, should be section/fragment' if template.split('/').length != 2

      section = template.split('/').first
      fragment = template.split('/').last
      cotent = capture(&block) if block_given?
      render(partial: "helpers/bootstrap/#{section}/#{fragment}", locals: locals.merge({ content: content, content: content }))
    end
  end
end
