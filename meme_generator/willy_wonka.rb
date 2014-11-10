module MemeGenerator
  class WillyWonka < BaseMeme

    def generator_id
      542616
    end

    def image_id
      2729805
    end

    def tokenize
      captures = request_text.match(/jarvis.+willy wonka(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
