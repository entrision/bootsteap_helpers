module BootstrapHelpers
  class Alert
    include ActionView::Helpers::CaptureHelper

    def initialize(view_context)
      @ac = view_context
    end

    def generate_icon(icon, level)
      return '' unless icon
      return icon.html_safe if icon.is_a? String

      case level.to_s
      when 'success'
        Icon.render('check-circle-fill')
      when 'info'
        Icon.render('info-circle-fill')
      else
        Icon.render('exclamation-triangle-fill')
      end
    end

    def link(title = nil, url = '#', options = {}, &block)
      klass = options[:class] || ''
      klass += 'alert-link'
      options[:class] = klass
      bs_render template: 'alert/link', locals: { title: title, url: url, options: options }, &block
    end

    def icon(level: 'warning', custom: nil)
      return custom unless custom.blank?

      generate_icon(true, level)
    end

    def heading(text = '', &block)
      bs_render template: 'alert/heading', locals: { text: text }, &block
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
