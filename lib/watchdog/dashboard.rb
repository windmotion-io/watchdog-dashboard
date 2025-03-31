require "watchdog/dashboard/version"
require "watchdog/dashboard/engine"

module Watchdog
  module Dashboard
    class << self
      attr_accessor :config

      def configure
        self.config ||= Configuration.new
        yield(config) if block_given?
      end
    end

    class Configuration
      attr_accessor :watchdog_api_url, :watchdog_api_token
    end
  end
end
