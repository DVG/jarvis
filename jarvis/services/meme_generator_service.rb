module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /(success kid|one does not simply)/i

      def meme_class
        case text
        when /(success kid)/i
          MemeGenerator::SuccessKid
        when /(one does not simply)/i
          MemeGenerator::OneDoesNotSimply
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
