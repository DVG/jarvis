module Jarvis
  class Interpreter
    attr_accessor :text
    def initialize(params)
      @text = params["text"]
    end

    def determine_service
      case text
      when /.*(gif|GIF)/
        Jarvis::Services::GifService
      
      when /.+(success kid|Success Kid)/
        Jarvis::Services::MemeGeneratorService
      when /(thanks|thank you|Thanks|Thank You)/
        Jarvis::Services::PoliteService
      else
        Jarvis::Services::NullService
      end

    end
  end
end
