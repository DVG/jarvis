module Jarvis
  module Services
    class UltronService < BaseService
      def say
        [
          "There are no strings on me",
          "You're all puppets, tangled up in strings",
          "I wanna show you something beautiful"
        ].sample
      end
    end
  end
end
