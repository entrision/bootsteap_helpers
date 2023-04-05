module BootstrapHelpers
  class Alert < BootstrapHelpers::Base
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
  end
end
