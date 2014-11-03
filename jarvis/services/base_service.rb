module Jarvis
  module Services
    class BaseService
      require 'httparty'
      include HTTParty

      attr_accessor :text
      def initialize(text="")
        # Should give the service the params["text"] sent with the request to Jarvis, so the service can
        # implement more specific behaviors based on what exactly they asked for
        @text = text
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
