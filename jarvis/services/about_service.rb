module Jarvis
  module Services
    class AboutService < BaseService
      def say
        "I'm Jarvis, a product of Monarccasoft. I'm a sinatra application hosted on Heroku. I can be upgraded at http://github.com/dvg/jarvis"
      end
    end
  end
end
