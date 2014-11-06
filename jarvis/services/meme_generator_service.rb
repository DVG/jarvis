module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /(success kid)/i

      def meme_class
        case text
        when /(success kid)/i
          MemeGenerator::SuccessKid
        end
      end

      def run 
        link = meme_class.new(text).get
        @link = response.parsed_response["result"]["instanceImageUrl"]
      end

      def say
        "Here you go, #{user_name}\n\n#{@link}"
      end

    end
  end
end
