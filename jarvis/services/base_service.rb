module Jarvis
  module Services
    class BaseService
      require 'httparty'
      include HTTParty

      attr_accessor :message
      def initialize(message)
        # all attributes of the slack message will be available to the service class.
        @message = SimpleDelegator.new(message)
      end

      def run
        # All Services should implement this method to perform their designated action
        # Not implementing this method will result in nothing being run and return whatever comes from #say
        # You should always return self as to not break the api endpoint
        self
      end

      def say
        # All Services should implement this method to return what Jarvis says in respose
      end
    end
  end
end
