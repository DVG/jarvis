module Jarvis
  module Services
    class MathService < BaseService

      def run
        @answer = evaluate(text)
        self
      end

      def say
        if @answer
            "According to my calculations #{@answer}"
        else
            "I'm sorry, I didn't understand that"
        end
      end

      def evaluate(input)
        res = /([\d]*\.?[\d]*)\s*([\+\-\/\*\%])\s*([\d]*\.?[\d]*)/.match(input)
        begin
            op = res[2].to_sym
            [res[1].to_f, res[3].to_f].inject(op)
        rescue
            false
        end
      end
      
    end
  end
end
