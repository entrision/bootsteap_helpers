# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ProgressHelper
      def progress_bar(percentage, options: {})
        bs_render('progress/bar', options: options, locals: { percentage: percentage })
      end
    end
  end
end
