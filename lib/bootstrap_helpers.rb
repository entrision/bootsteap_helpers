# frozen_string_literal: true

require 'bootstrap_helpers/configuration'
require 'listen'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.enable_reloading
loader.setup
# loader.eager_load

Listen.to('lib', "#{__dir__}/bootstrap_helpers/helpers", "#{__dir__}/bootstrap_helpers") do
  loader.reload
  bootstrap_helpers_load_helpers
end.start

require 'bootstrap_helpers/railtie' if defined?(Rails)

include BootstrapHelpers::Helpers::NavHelper
include BootstrapHelpers::Helpers::ButtonHelper


def bootstrap_helpers_load_helpers
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::NavHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::BaseHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::NavBarHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::GridHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ErrorHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ProgressHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ErrorHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::AlertHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::IconHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::CardHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ContainerHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::NavHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ButtonHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::AccordionHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::ModalHelper }
  ActiveSupport.on_load(:action_view) { include BootstrapHelpers::Helpers::DefinitionListHelper }
end

module BootstrapHelpers
  class Error < StandardError; end
  # Your code goes here...

  class Engine < ::Rails::Engine
  end
end
