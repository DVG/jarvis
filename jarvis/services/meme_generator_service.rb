module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /.*(success kid|Success Kid):/
      SUCCESS_KID_ID = 121
      SUCCESS_KID_IMAGE_ID = 1031
      USERNAME = ENV["MEME_GENERATOR_USER"]
      PASSWORD = ENV["MEME_GENERATOR_PASSWORD"]

      def meme_params
        case text
        when /(success kid|Success Kid)/
          "&generatorID=#{SUCCESS_KID_ID}&imageID=#{SUCCESS_KID_IMAGE_ID}"
        else
          121
        end
      end
      
      def meme_text
        text.split(":")[1]
      end

      def text_params
        if two_lines?
          "&text0=#{text0}&text1=#{text1}"
        else
          "&text0=#{text0}"
        end
      end

      def two_lines?
        meme_text.split(",").size > 1
      end

      def text0
        URI.encode(meme_text.split(",")[0].strip)
      end

      def text1
        URI.encode(meme_text.split(",")[1].strip)
      end

      def get_meme_url
        "http://version1.api.memegenerator.net/Instance_Create?username=#{USERNAME}&password=#{PASSWORD}&languageCode=en#{meme_params}#{text_params}"
      end

      def run 
        response = HTTParty.get(get_meme_url)
        @link = response.parsed_response["result"]["instanceImageUrl"]
      end

      def say
        "Here you go, #{user_name}\n\n#{@link}"
      end
    end
  end
end
