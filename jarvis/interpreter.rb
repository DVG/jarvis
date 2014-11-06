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
      when /(gif|GIF)/
        Jarvis::Services::GifService 
      when Jarvis::Services::MemeGeneratorService::REGEX 
        Jarvis::Services::MemeGeneratorService
      when /(thanks|thank you|Thanks|Thank You).*/
        Jarvis::Services::PoliteService
      when /(fact|FACT|Fact)/
        Jarvis::Services::FactService
      when /(fuck|shit|goddamn)/
        Jarvis::Services::RudeService
      when /(about|About|ABOUT)/
        Jarvis::Services::AboutService
      when /(weather|Weather)/
        Jarvis::Services::WeatherService
      when /(tweet|Tweet)/
        Jarvis::Services::TwitterService
      when /(8ball|8BALL|8Ball)/
        Jarvis::Services::EightballService
      when /(quote|Quote)/
        Jarvis::Services::QuoteService
      when /(are you up|Are You Up|Are you up)/
        Jarvis::Services::UpService
      when /(word up|Word Up|Word up|word Up)/
        Jarvis::Services::UrbanDictionaryService
      when /(roll|ROLL|Roll|diceroll|Diceroll|DICEROLL|DiceRoll)/
        Jarvis::Services::DiceService
      when /(suit up|Suit Up|SUIT UP)/
        Jarvis::Services::NPHService
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
