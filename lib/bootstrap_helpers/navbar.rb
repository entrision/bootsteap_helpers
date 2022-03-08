module BootstrapHelpers
  class Navbar
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def collapse(options = {}, &block)
      id = options[:id] || SecureRandom.uuid
      classes = options[:classes]
      bs_render template: 'navbar/collapse', locals: { classes: classes, id: id, style: options[:style] }, &block
    end

    def items(options = {}, &block)
      bs_render template: 'navbar/list', locals: { klass: options[:class] }, &block
    end

    def link(title = nil, url = '#', options = {} , &block)
      klass = options[:class] || ''
      klass += ' active' if @ac.current_page?(url)
      bs_render template: 'navbar/link', locals: { title: title, url: url, klass: klass, data: options[:data], aria: options[:aria] }, &block
    end

    def brand(options = {})
      target ||= '/'
      content = options[:content]
      css = options[:css]
      bs_render template: 'navbar/brand', locals: { content: content, classes: css, target: target }
    end

    def toggler(target:, options: {}, &block)
      bs_render template: 'navbar/toggler', locals: { target: target }, &block
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
