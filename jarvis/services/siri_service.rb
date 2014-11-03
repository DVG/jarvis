module Jarvis
  module Services
    class SiriService < BaseService
      def say
        [
          "What did you just call me?"
        ].sample
      end
    end
  end
end
