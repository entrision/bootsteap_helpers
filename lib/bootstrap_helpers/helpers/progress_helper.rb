# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ProgressHelper
      def progress_bar(percentage, color: 'success', label: nil, options: {})
        progress_render('bar', locals: { percentage: percentage, color: color, label: label, options: options })
      end

      def progress_render(partial_name, locals: {})
        render(partial: "helpers/bootstrap/progress/#{partial_name}", locals: locals)
      end
    end
  end
end
