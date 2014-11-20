module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /(success kid|one does not simply|y u no|what if i told you|willy wonka|overly attached girlfriend|, everywhere)/i

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
        when /(, everywhere)/i
          MemeGenerator::Everywhere
        end
      end

      def run 
        response = JSON.parse(meme_class.new(text).get.parsed_response)
        if response["success"]
          @link = response["data"]["url"]
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
