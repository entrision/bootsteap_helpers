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
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
          <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </svg>'.html_safe
      when 'info'
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
          <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
        </svg>'.html_safe
      else
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
          <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </svg>'.html_safe
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
