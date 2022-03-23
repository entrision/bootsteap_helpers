# frozen_string_literal: true

module Bootstrap
  module IconHelper
    def icon(name)
      BootstrapHelpers::Icon.render(name)
    end
  end
end
