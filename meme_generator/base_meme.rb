module MemeGenerator
  class BaseMeme
    require 'uri'
    require 'json'

    USERNAME = ENV["IMGFLIP_USER"]
    PASSWORD = ENV["IMGFLIP_PASSWORD"]

    attr_accessor :request_text, :text0, :text1

    def initialize(request_text)
      @request_text = request_text
    end
    
    def tokenize
      # implement in subclass to parse the request text to text0 and text1
    end

    def get
      tokenize
      body = {
        template_id: template_id,
        username: USERNAME,
        password: PASSWORD,
        text0: text0,
        text1: text1
      }
      HTTParty.post(url, body: body)
    end

    def template_id
    end
    
    def url
      "https://api.imgflip.com/caption_image"
    end

  end
end
