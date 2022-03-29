# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ProgressHelper
      def progress_bar(percentage, color: 'success', label: nil, options: {})
        animated = options[:animated]
        animated = true if options[:animated].nil?
        striped = options[:striped]
        striped = true if options[:striped].nil?
        progress_render('bar', locals: { percentage: percentage, color: color, label: label, options: options, striped: striped, animated: animated })
      end

      def progress_render(partial_name, locals: {})
        render(partial: "helpers/bootstrap/progress/#{partial_name}", locals: locals)
      end
    end
  end
end
