module MemeGenerator
  class NotSureIf < BaseMeme

    def template_id
      61520
    end

    def tokenize
      captures = request_text.match(/jarvis.+(not sure if.+),(.+)/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
