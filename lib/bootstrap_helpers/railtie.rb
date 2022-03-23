# frozen_string_literal: true

# require 'bootstrap_helpers/helpers/nav_bar_helper'
# require 'bootstrap_helpers/helpers/base_helper'
# require 'bootstrap_helpers/helpers/error_helper'
# require 'bootstrap_helpers/helpers/grid_helper'
# require 'bootstrap_helpers/helpers/progress_helper'
# require 'bootstrap_helpers/helpers/alert_helper'
# require 'bootstrap_helpers/helpers/icon_helper'

module BootstrapHelpers
  class Railtie < Rails::Railtie
    initializer 'bootstrap_helpers.view_helpers' do
      bootstrap_helpers_load_helpers
    end
  end
end
