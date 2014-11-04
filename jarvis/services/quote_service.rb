module Jarvis
  module Services
    class QuoteService < BaseService

      def run
        @response = HTTParty.get("http://iheartquotes.com/api/v1/random?format=json#{source}")
      end

      def say
        @response.parsed_response["quote"].strip
      end

      def source
        case text
        when /(Simpsons|simpsons|Homer|homer)/
          "&source=simpsons_homer"
        when /(Star Wars|star wars|Star wars|luke|leia|vader|Vader|Luke|Leia)/
          "&source=starwars"
        else
          ""
        end
      end
    end
  end
end