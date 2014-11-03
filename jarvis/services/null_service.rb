module Jarvis
  module Services
    class NullService < BaseService
      def say
        [
          "Sir, I'm afraid I don't know what you're talking about",
          "Sir, what is this I don't even",
          "I'm Jarvis, created by MonarccaSoft"
        ].sample
      end
    end
  end
end
