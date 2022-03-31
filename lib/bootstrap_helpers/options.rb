# frozen_string_literal: true

module BootstrapHelpers
  class Options
    def initialize(*args, **named_args)
      @unnamed_args = args
      @named_args = named_args
      @processed = false

      @classes = []
      @styles = []
    end

    def id
      return @named_args[:id] if @named_args[:id]

      @named_args[:id] = SecureRandom.uuid
    end

    def classes
      @classes + attribute_parse(%i[class classes css], ' ')
    end

    def styles
      @styles + attribute_parse(%i[style styles], ';')
    end

    def to_s(include_classes: [])
      process unless @processed
      include_classes = include_classes.join(' ') if include_classes.is_a? Array
      "style=\"#{styles.join(';')}\" class=\"#{include_classes} #{classes.join(' ')}\" id=\"#{id}\"".html_safe
    end

    def extract(key, default: nil)
      return instance_variable_get("@#{key}") unless instance_variable_get("@#{key}").nil?
      return default unless @named_args.key? key

      value = @named_args.delete key
      instance_variable_set("@#{key}", value)
      return default if value.nil?

      value
    end

    private

    def process
      @processed = true
      parse_out_classes(@named_args)
    end

    def parse_out_classes(values, size: nil, attrib: nil)
      if values.is_a? Hash
        values.each do |key, value|
          next if BootstrapHelpers.configuration.excluded_attributes.include? key

          if BootstrapHelpers.configuration.sizes.include? key.to_sym
            parse_out_classes(value, size: key, attrib: attrib)
          elsif value.is_a? Hash
            parse_out_classes(value, attrib: key, size: size)
          else
            parse_out_classes(value, size: size, attrib: key)
          end
        end
      else
        build_class(attrib: attrib, value: values, size: size)
      end
    end

    def build_class(attrib:, value:, size:)
      prefix, value = sanitize_values(attrib, value)
      @classes << "#{prefix}-#{size}-#{value}" if size
      @classes << "#{prefix}-#{value}" unless size
    end

    def sanitize_values(attribute, value)
      BootstrapHelpers.configuration.equivalents.each do |equal|
        next unless equal[:attributes].include? attribute.to_s

        attribute = equal[:prefix]
        return attribute, value unless equal[:equals].is_a? Array

        equal[:equals].each do |eq_value|
          value = eq_value[value] if eq_value.key? value
        end
      end

      return attribute, value
    end

    def attribute_parse(arguments, split)
      return [] if arguments.blank?

      to_return = []
      arguments.each do |argument|
        value = @named_args[argument]
        next if value.blank?

        to_return << value.split(split) if value.is_a? String
        to_return << value unless value.is_a? String
      end
      to_return.flatten
    end
  end
end
