module MemeGenerator
  class OneDoesNotSimply < BaseMeme

    def template_id
      61579
    end

    def text0
      "One Does Not Simply"
    end

    def tokenize
      captures = request_text.match(/jarvis.+one does not simply(.+)/i).captures.map {|t| t.strip if t }
      self.text1 = captures[0] || ""
      true
    end
  end
end
