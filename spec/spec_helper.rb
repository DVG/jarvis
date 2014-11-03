ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'rack/test'
require 'json'
require 'jarvis'
include Rack::Test::Methods
require 'byebug'

def slack_outgoing_message(text="Jarvis, what's going on?")
  {
    "team_id" => "T0001",
    "channel_id" => "BLAH",
    "channel_name" => "test",
    "timestamp" => "1355517523.000005",
    "user_id" => "U2147483697",
    "user_name" => "Steve",
    "text" => text,
    "trigger_word" => "Jarvis"
  }
end
