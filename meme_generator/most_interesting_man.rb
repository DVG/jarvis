module MemeGenerator
  class MostInterestingMan < BaseMeme

    def template_id
      61532
    end

    def tokenize
      captures = request_text.match(/jarvis.+(i don'?t always.+), (but when I do.+)/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text0 = captures[1] || ""
      true
    end
  end
end
