module MemeGenerator
  class SuccessKid < BaseMeme

    def generator_id
      121
    end

    def image_id
      1031
    end

    def tokenize
      captures = request_text.match(/jarvis.+success kid(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
