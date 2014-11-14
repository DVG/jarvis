module MemeGenerator
  class OverlyAttachedGirlfriend < BaseMeme

    def template_id
      100952
    end

    def tokenize
      captures = request_text.match(/jarvis.+overly attached girlfriend(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = captures[1] || ""
      true
    end
  end
end
