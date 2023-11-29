# frozen_string_literal: true

module Ntfy
  # @return [Ntfy::Configuration] current configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set Gem configurations
  # @param config [Ntfy::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify current configuration
  #
  # @yieldparam [Ntfy::Configuration] config current configuration
  #
  # @example Configure Ntfy gem with a custom server URL
  #
  #   Ntfy.configure do |config|
  #     config.base_url = "custom-server.ntfy.sh"
  #   end
  #
  def self.configure
    yield configuration
  end

  # The configuration class for Ntfy gem.
  class Configuration
    # Configure the protocol to use for the server
    # Default's to `https`
    #
    # @return [String]
    attr_accessor :protocol

    # Configure the server url if you are running your own server
    # Default's to `https://ntfy.sh`
    #
    # @return [String]
    attr_accessor :base_url

    # Initializes a new instance of the Configuration class.
    def initialize
      @protocol = "https"
      @base_url = "ntfy.sh"
    end
  end
end
