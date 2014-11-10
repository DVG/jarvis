module MemeGenerator
  class OverlyAttachedGirlfriend < BaseMeme

    def generator_id
      1152019
    end

    def image_id
      4915715
    end

    def tokenize
      captures = request_text.match(/jarvis.+overly attached girlfriend(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
