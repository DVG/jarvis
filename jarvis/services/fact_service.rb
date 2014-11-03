module Jarvis
  module Services
    class FactService < BaseService

      def random_fact
        @fact = HTTParty.get("http://numbersapi.com/random")
        self
      end

      def run
        random_fact
      end

      def say
        "#{@fact}"
      end
    end
  end
end