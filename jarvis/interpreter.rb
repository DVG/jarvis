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
      end
    end
  end
end
