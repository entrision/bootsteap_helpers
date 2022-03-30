# frozen_string_literal: true

module BootstrapHelpers
  class Grid
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def col(options = {}, &block)
      classes = Grid.generate_col_classes(options)
      id = options[:id] || SecureRandom.uuid
      bs_render(template: 'grid/column', locals: { classes: classes, id: id, style: options[:style] }, &block)
    end
    alias column col

    private

    def bs_render(template:, locals: {}, &block)
      raise ArgumentError, 'template is not formatted correctly, should be section/fragment' if template.split('/').length != 2

      section = template.split('/').first
      fragment = template.split('/').last
      content = locals[:content]
      content = @ac.capture(self, &block) if block_given?
      @ac.render(partial: "helpers/bootstrap/#{section}/#{fragment}", locals: locals.merge({ content: content }))
    end
  end
end
