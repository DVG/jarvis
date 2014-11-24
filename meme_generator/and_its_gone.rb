module MemeGenerator
  class AndItsGone < BaseMeme

    def template_id
      766986
    end

    def text1
      "Annnnnnnd it's gone"
    end

    def tokenize
      captures = request_text.match(/jarvis (.+)and it'?s gone/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      true
    end
  end
end
