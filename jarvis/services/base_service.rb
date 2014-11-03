module Jarvis
  module Services
    class BaseService
      require 'httparty'
      include HTTParty

      attr_accessor :response, :link

      def host

      end

      def endpoint

      end
    end
  end
end
