module Jarvis
  class Interpreter
    attr_accessor :text
    def initialize(params)
      @text = params["text"]
    end

    def determine_service
      case text
      when /^(Siri|siri)/
        Jarvis::Services::SiriService
      when /.*(gif|GIF)/
        Jarvis::Services::GifService 
      when /.+(success kid|Success Kid)/
        Jarvis::Services::MemeGeneratorService
      when /.*(thanks|thank you|Thanks|Thank You).*/
        Jarvis::Services::PoliteService
      when /.*(fact|FACT|Fact)/
        Jarvis::Services::FactService
      when /.*(fuck|shit|goddamn)/
        Jarvis::Services::RudeService
      when /.*(tell me about yourself|Tell me about yourself|who are you|Who are you)/
        Jarvis::Services::AboutService
      when /.*(weather|Weather)/
        Jarvis::Services::WeatherService
      when /.*(8ball|8BALL|8Ball)/
        Jarvis::Services::EightballService
      else
        Jarvis::Services::NullService
      end

    end
  end
end
