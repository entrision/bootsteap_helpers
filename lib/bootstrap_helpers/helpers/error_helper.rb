# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module ErrorHelper
      def form_errors(objekt, options = {})
        return if objekt.errors.blank?

        bs_render template: 'error/form_errors', options: options, locals: { objekt: objekt }
      end
    end
  end
end
