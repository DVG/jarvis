module Jarvis
  module Services
    class MemeGeneratorService < BaseService
      REGEX = /(you're gonna have a bad time|and it'?s gone|afraid to ask|sudden clarity|success kid|not sure if|picard|one does not simply|y u no|what if i told you|willy wonka|overly attached girlfriend|everywhere|i don'?t always.+but when i do)/i

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
        when /(everywhere)/i
          MemeGenerator::Everywhere
        when /(i don'?t always.+but when i do)/i
          MemeGenerator::MostInterestingMan
        when /(picard)/i
          MemeGenerator::Picard
        when /(not sure if)/i
          MemeGenerator::NotSureIf
        when /(sudden clarity)/i
          MemeGenerator::SuddenClarity
        when /(afraid to ask)/i
          MemeGenerator::AfraidToAsk
        when /(and it'?s gone)/i
          MemeGenerator::AndItsGone
        when /(you're gonna have a bad time)/i
          MemeGenerator::GonnaHaveABadTime
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
