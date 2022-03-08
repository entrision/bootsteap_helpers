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

    def self.generate_col_classes(options)
      classes = []
      classes << options[:class] if options[:class]
      classes << "col-#{options[:size].to_i}" if options[:size]
      classes << "offset-#{options[:offset].to_i}" if options[:offset]
      %i[sm md lg xl].each do |size|
        classes << get_classes(options, size)
      end
      classes.flatten
    end

    def self.get_classes(options, key)
      classes = []
      if options[key]
        classes << "col-#{key}-#{options[key][:size]}" if options[key][:size]
        classes << "offset-#{key}-#{options[key][:offset]}" if options[key][:offset]
      end
      classes
    end

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
