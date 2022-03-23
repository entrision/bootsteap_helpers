# frozen_string_literal: true

module BootstrapHelpers
  module Helpers
    module IconHelper
      def icon(name)
        BootstrapHelpers::Icon.render(name)
      end
    end
  end
end
