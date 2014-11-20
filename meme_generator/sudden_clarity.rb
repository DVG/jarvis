module MemeGenerator
  class SuddenClarity < BaseMeme

    def template_id
      100948
    end

    def tokenize
      captures = request_text.match(/jarvis.+sudden clarity(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
