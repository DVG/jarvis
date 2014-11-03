module Jarvis
  module Services
    class PoliteService < BaseService
      def say
        case @text
        when /(thanks|thank you|Thanks|Thank You)/
          "You are quite, welcome, sir."
        end
      end
    end
  end
end
