module Jarvis
  module Services
    class TwitterService < BaseService

      TOKEN = "xoxp-2867696730-2867738388-2930730274-d0198a"

      def initialize()
        super
        @twitter = get_twitter
      end

      def request
        [token, channel, count].join("&")
      end

      def run
        @tweet = post_tweet
        @link = "https://twitter.com/monnarcasoft/status/#{@tweet.id}"
        self
      end

      def say
        "Here you are, sir #{@link}"
      end

private

      def get_twitter
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = "tRDGznfoPEu5snhHXfJBW0t8J"
          config.consumer_secret     = "9qathWz1Uhe0m7qeKFxsibb8Lp4n14ylbXGtWYKu3Ta8PaHkZH"
          config.access_token        = "2859748697-x4W6RsCXpnOoretNrt8iv8PsXc6tNSmIXjLs1xi"
          config.access_token_secret = "uDMBPvCoJAcnNTSRzqzZCssvo24TAOOF2G0kNkt6WHTdw"
        end
        client
      end

      def post_tweet
        @response = HTTParty.get("#{host}#{endpoint}?#{request}")
        @msg = @response.parsed_response["messages"][1]["text"]
        @twitter.update(@msg)
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
