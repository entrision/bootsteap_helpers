module BootstrapHelpers
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    alias_method :config, :configuration
  end

  class Configuration
    attr_accessor :equivalents
    attr_accessor :sizes
    attr_accessor :excluded_attributes

    def initialize
      @equivalents = YAML.safe_load(File.read(File.expand_path('../../config/equivalents.yaml', __dir__))).deep_symbolize_keys[:equivalents]
      @sizes = %i[xs sm md lg xl xxl].freeze
      @excluded_attributes = %i[styles classes css style class id].freeze
    end
  end
end
