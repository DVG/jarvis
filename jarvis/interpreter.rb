module Jarvis
  class Interpreter
    attr_accessor :text
    def initialize(params)
      @text = params["text"]
    end

    def determine_service
      case text
      when /^(Siri)/i
        Jarvis::Services::SiriService
      when /(gif)/i
        Jarvis::Services::GifService
      when Jarvis::Services::MemeGeneratorService::REGEX
        Jarvis::Services::MemeGeneratorService
      when /(thanks|thank you)/i
        Jarvis::Services::PoliteService
      when /(fact)/i
        Jarvis::Services::FactService
      when /(fuck|shit|goddamn)/i
        Jarvis::Services::RudeService
      when /(about)/i
        Jarvis::Services::AboutService
      when /(weather)/i
        Jarvis::Services::WeatherService
      when /(tweet)/i
        Jarvis::Services::TwitterService
      when /(8ball)/i
        Jarvis::Services::EightballService
      when /(quote)/i
        Jarvis::Services::QuoteService
      when /(are you up)/i
        Jarvis::Services::UpService
      when /(word up)/i
        Jarvis::Services::UrbanDictionaryService
      when /(roll|diceroll)/i
        Jarvis::Services::DiceService
      when /(suit up)/i
        Jarvis::Services::NPHService
      when /stats/i
        Jarvis::Services::StatsService
      when /\?$/
        Jarvis::Services::EightballService
      when /([\d]*\.?[\d]*)\s*([\+\-\/\*\%])\s*([\d]*\.?[\d]*)/
        Jarvis::Services::MathService
      else
        Jarvis::Services::NullService
      end

    end
  end
end
