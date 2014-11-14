module MemeGenerator
  class WhatIfIToldYou < BaseMeme

    def template_id
      100947
    end

    def text0
      "What if I told you"
    end

    def tokenize
      captures = request_text.match(/jarvis.+what if i told you(.+)/i).captures.map {|t| t.strip if t }
      self.text1 = captures[0] || ""
      true
    end
  end
end
