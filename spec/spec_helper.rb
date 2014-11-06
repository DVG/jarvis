ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'rack/test'
require 'json'
require 'jarvis'
include Rack::Test::Methods
require 'byebug'

def slack_outgoing_message(options={text:"Jarvis, what's going on?"})
  {
    "team_id" => options[:team_id] || "T0001",
    "channel_id" => options[:channel_id] || "BLAH",
    "channel_name" => options[:channel_name] || "test",
    "timestamp" => options[:timestamp] || "1355517523.000005",
    "user_id" => options[:user_id] || "U2147483697",
    "user_name" => options[:user_name] || "Steve",
    "text" => options[:text],
    "trigger_word" => options[:trigger_word] || "Jarvis"
  }
end
