module Jarvis
  module Services
    class GifService < BaseService

      API_VERSION = "v1"
      API_KEY = "dc6zaTOxFJmzC"

      def host
        "http://api.giphy.com/"
      end

      def endpoint
        "#{API_VERSION}/gifs/"
      end

      def random
        @response = HTTParty.get("#{host}#{endpoint}random?api_key=#{API_KEY}") 
        @link = response.parsed_response["data"]["image_url"]
        self
      end

      def run
        random
      end

      def say
        "Here you are, sir #{@link}"
      end

    end
  end
end
