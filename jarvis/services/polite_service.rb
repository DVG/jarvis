module Jarvis
  module Services
    class PoliteService < BaseService
      def say
        [
          "You are quite welcome, sir.",
          "Anytime, sir."
        ].sample
      end
    end
  end
end
