# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module IconHelper
      def icon(name, options = {})
        BootstrapHelpers::Icon.render(name, options)
      end
    end
  end
end
