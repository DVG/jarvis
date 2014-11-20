module MemeGenerator
  class Everywhere < BaseMeme

    def template_id
      347390
    end

    def tokenize
      captures = request_text.match(/jarvis(.+),(.+) everywhere?/i).captures.map {|t| t.strip if t }
      self.text0 = captures[0] || ""
      self.text1 = "#{captures[1]} everywhere"
      true
    end
  end
end
