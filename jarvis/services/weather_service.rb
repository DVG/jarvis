module Jarvis
  module Services
    class WeatherService < BaseService

      def run
        @response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Columbus,oh")
        self
      end

      def say
        "The #{description}, sir. The current temperature is #{temp}"
      end

      def description
        @response["weather"]["description"]
      end

      def temp
        ((@response["main"]["temp"] - 273.15) * 1.8) + 32
      end
    end
  end
end
