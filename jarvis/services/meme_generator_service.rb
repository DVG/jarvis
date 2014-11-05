module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /.*(success kid|Success Kid)/
      SUCCESS_KID_ID = 121
      USERNAME = ENV["MEME_GENERATOR_USER"]
      PASSWORD = ENV["MEME_GENERATOR_PASSWORD"]

      def meme_id
        case text
        when /(success kid|Success Kid)/
          SUCCESS_KID_ID
        else
          121
        end
      end

      def text0
        text.split(",")[1]
      end

      def text1
        text.split(",")[2]
      end

      def run 
        response = HTTParty.get("http://version1.api.memegenerator.net/Instance_Create?username=#{USERNAME}&password=#{PASSWORD}&languageCode=en&generatorID=#{meme_id}&imageID=20&text0=#{text0}&text1=#{text1}")
        @link = response.parsed_response["result"]["instanceImageUrl"]
      end

      def say
        "Here you go, #{user_name}\n\n#{link}"
      end
    end
  end
end
