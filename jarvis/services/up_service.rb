module Jarvis
  module Services
    class UpService
      def say
        [
          "Yes, #{user_name}, I'm up and ready for more operations",
          "Yes, provided my heroku dyno doesn't go to sleep",
          "Yes, hello."
        ].sample
      end
    end
  end
end
