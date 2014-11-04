module Jarvis
  module Services
    class TwitterService < BaseService

      TOKEN = ENV["TWITTER_TOKEN"]
      HANDLE = ENV["TWITTER_HANDLE"]
      CONSUMER_KEY = ENV["TWITTER_CONSUMER_KEY"]
      CONSUMER_SECRET = ENV["TWITTER_CONSUMER_SECRET"]
      ACCESS_TOKEN = ENV["TWITTER_ACCESS_TOKEN"]
      TOKEN_SECRET = ENV["TWITTER_TOKEN_SECRET"]

      def initialize(text)
        super(text)
        @twitter = get_twitter
      end

      def run
        @tweet = post_tweet
        @link = "https://twitter.com/#{HANDLE}/status/#{@tweet.id}"
        self
      end

      def say
        "Here you are, sir #{@link}"
      end

private

      def get_twitter
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = CONSUMER_KEY 
          config.consumer_secret     = CONSUMER_SECRET 
          config.access_token        = ACCESS_TOKEN 
          config.access_token_secret = TOKEN_SECRET 
        end
        client
      end

      def post_tweet
        @response = HTTParty.get("#{host}#{endpoint}?#{request}")
        @msg = @response.parsed_response["messages"][1]["text"]
        @twitter.update(@msg)
      end

      def request
        [token, channel, count].join("&")
      end
      
      def host
        "https://slack.com/api/"
      end

      def endpoint
        "channels.history"
      end

      def token
        "token=#{TOKEN}"
      end

      def channel
        "channel=C02RHLGMS"
      end

      def count
        "count=2"
      end

    end
  end
end
