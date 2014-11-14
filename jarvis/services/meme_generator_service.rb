module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /(success kid|one does not simply|y u no|what if i told you|willy wonka|overly attached girlfriend)/i

      def meme_class
        case text
        when /(success kid)/i
          MemeGenerator::SuccessKid
        when /(one does not simply)/i
          MemeGenerator::OneDoesNotSimply
        when /(y u no)/i
          MemeGenerator::YUNo
        when /(what if i told you)/i
          MemeGenerator::WhatIfIToldYou
        when /(willy wonka)/i
          MemeGenerator::WillyWonka
        when /(overly attached girlfriend)/i
          MemeGenerator::OverlyAttachedGirlfriend
        end
      end

      def run 
        response = meme_class.new(text).get
        if response.parsed_response["success"]
          @link = response.parsed_response["data"]["url"]
        else
          raise "ImgFlip API failed, sir"
        end
      end

      def say
        "Here you go, #{user_name}\n\n#{@link}"
      end

    end
  end
end
