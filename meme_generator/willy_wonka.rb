module MemeGenerator
  class WillyWonka < BaseMeme

    def template_id
      61582
    end

    def tokenize
      captures = request_text.match(/jarvis.+willy wonka(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
