module MemeGenerator
  class YUNo < BaseMeme

    def template_id
      61527
    end

    def text0
      "Y U NO"
    end

    def tokenize
      captures = request_text.match(/jarvis.+y u no(.+)/i).captures.map {|t| t.strip if t }
      self.text1 = captures[0] || ""
      true
    end
  end
end
