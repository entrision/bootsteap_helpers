# frozen_string_literal: true

require 'bootstrap_helpers/helpers/nav_bar_helper'
require 'bootstrap_helpers/helpers/base_helper'
require 'bootstrap_helpers/helpers/error_helper'
require 'bootstrap_helpers/helpers/grid_helper'
require 'bootstrap_helpers/helpers/progress_helper'

module BootstrapHelpers
  class Railtie < Rails::Railtie
    initializer 'bootstrap_helpers.view_helpers' do
      ActiveSupport.on_load(:action_view) { include Bootstrap::BaseHelper }
      ActiveSupport.on_load(:action_view) { include Bootstrap::NavBarHelper }
      ActiveSupport.on_load(:action_view) { include Bootstrap::GridHelper }
      ActiveSupport.on_load(:action_view) { include Bootstrap::ErrorHelper }
      ActiveSupport.on_load(:action_view) { include Bootstrap::ProgressHelper }
      ActiveSupport.on_load(:action_view) { include Bootstrap::ErrorHelper }
    end
  end
end
