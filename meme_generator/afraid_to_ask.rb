module MemeGenerator
  class AfraidToAsk < BaseMeme

    def template_id
      22590034
    end

    def text1
      "And at this point, I'm afraid to ask"
    end

    def tokenize
      captures = request_text.match(/jarvis (.+),? and at this point/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      true
    end
  end
end
