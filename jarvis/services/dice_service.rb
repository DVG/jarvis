module Jarvis
  module Services
    class DiceService < BaseService

      def say
        [
          "Your roll yields #{roll}",
          "#{roll}",
          "You got a #{roll}"
        ].sample
      end

private
 
      def roll 
        input = text[/(\d+[d]\d+)/].split("d")
        input[0].to_i.times.map{ Random.rand(input[1].to_i) }.inject(:+)
      end

    end
  end
end
