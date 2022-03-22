# frozen_string_literal: true

require 'bootstrap_helpers/version'
require 'bootstrap_helpers/grid'
require 'bootstrap_helpers/navbar'
require 'bootstrap_helpers/alert'
require 'bootstrap_helpers/railtie' if defined?(Rails)

module BootstrapHelpers
  class Error < StandardError; end
  # Your code goes here...

  class Engine < ::Rails::Engine
  end
end
