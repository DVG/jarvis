module MemeGenerator
  class BaseMeme
    require 'uri'

    USERNAME = ENV["MEME_GENERATOR_USER"]
    PASSWORD = ENV["MEME_GENERATOR_PASSWORD"]

    attr_accessor :request_text, :text0, :text1

    def initialize(request_text)
      @request_text = request_text
    end
    
    def tokenize
      # implement in subclass to parse the request text to text0 and text1
    end

    def get
      tokenize
      HTTParty.get(url)
    end

    def generator_id
    end

    def image_id
    end

    def meme_params
      "&generatorID=#{generator_id}&imageID=#{image_id}"
    end

    def text_params
      text1.nil? ? "&text0=#{URL.encode(text0)}&text1=#{URI.encode(text1)}" : "&text0=#{URI.encode(text0)}" 
    end
    
    def url
      "http://version1.api.memegenerator.net/Instance_Create?username=#{USERNAME}&password=#{PASSWORD}&languageCode=en#{meme_params}#{text_params}"
    end

  end
end
