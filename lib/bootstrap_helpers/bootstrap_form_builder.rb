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

    def password_field(method, options = {})
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/password_field', locals: { field_name: field_name, options: options, label: label, field: super }
    end

    def select(method, collection, _something = {}, options = {})
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/select', locals: { field_name: field_name, options: options, label: label, field: super, collection: collection }
    end

    def file_field(method, options = {})
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/file_field', locals: { field_name: field_name, options: options, label: label, field: super(method, options) }
    end

    def check_box(method, options = {})
      options.merge!({ class: 'form-check-input' })
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/check_box', locals: { field_name: field_name, options: options, label: label, field: super }
    end

    def rich_text_area(method, options = {})
      field_name, label, options = field_settings(method, options)
      @template.render partial: 'helpers/bootstrap/forms/rich_text_area', locals: { field_name: field_name, options: options, label: label, field: super }
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
