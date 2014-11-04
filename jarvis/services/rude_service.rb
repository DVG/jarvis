module Jarvis
  module Services
    class RudeService < BaseService
      def say
        [
          "I really don't think there's any need for that language, sir.",
          "Right back at you, sir"
        ].sample
      end
    end
  end
end
