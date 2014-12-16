module MemeGenerator
  class GonnaHaveABadTime < BaseMeme

    def template_id
      100951
    end

    def text1
      "You're gonna have a bad time"
    end

    def tokenize
      captures = request_text.match(/jarvis (.+),? you're gonna have a bad time/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      true
    end
  end
end
