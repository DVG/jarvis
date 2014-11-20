module MemeGenerator
  class Picard < BaseMeme

    def template_id
      245898
    end

    def tokenize
      captures = request_text.match(/jarvis.+picard(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
