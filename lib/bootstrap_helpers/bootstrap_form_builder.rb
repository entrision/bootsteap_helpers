module BootstrapHelpers
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    def field_settings(method, options = {}, no_class = false)
      options[:class] ||= 'form-control form-control-sm' unless no_class
      field_name = "#{@object_name}_#{method}"
      default_label = clean_label(method)
      is_label = options[:label]
      label = options[:label] ? options.delete(:label) : default_label
      options[:class] ||= ''
      options[:class] += options[:required] ? ' required' : ''
      label += '<strong><sup>*</sup></strong>' if options[:required] and !is_label
      [field_name, label, options]
    end

    def clean_label(method)
      method.to_s.humanize.titleize
    end

    def text_field(method, options = {})
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/text_field', locals: { field_name: field_name, options: options, label: label, field: super }
    end

    def submit(title = 'Save', options = {})
      css = options[:class] || ''
      css = "#{css} btn btn-primary"
      options[:class] = css
      options[:type] = 'submit'
      title = "#{BootstrapHelpers::Icon.render('save').html_safe} #{title}".html_safe
      button(title, options)
    end
  end
end
