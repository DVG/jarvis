module Jarvis
  module Services
    class DiceService < BaseService

      def say
        "Your roll yields #{@output}"
      end

private
 
      def roll 
        input = text[/(\d+[d]\d+)/].split("d")
        @output = input[0].to_i.times.map{ Random.rand(input[1].to_i) }.inject(:+)
      end

    end
  end
end