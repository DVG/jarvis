module Jarvis
  module Services
    class BaseService
      require 'httparty'
      include HTTParty
      require 'uri'
      attr_accessor :message
      def initialize(message)
        # all attributes of the slack message will be available to the service class.
        @message = message
      end

      def run
        # All Services should implement this method to perform their designated action
        # Not implementing this method will result in nothing being run and return whatever comes from #say
      end

      def say
        # All Services should implement this method to return what Jarvis says in respose
      end

      def method_missing(name, *args, &blk)
        message.public_send(name, *args, &blk)
      end
    end
  end
end
