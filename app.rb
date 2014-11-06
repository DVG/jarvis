# Load Path
$: << File.expand_path('../', __FILE__)
require 'sinatra'
require "sinatra/json"
require 'json'
require 'meme_generator'
require 'jarvis'
require 'slack'
require 'twitter'

get "/" do
  json text: "Hello, I'm Jarvis"
end

post "/jarvis" do
  interpreter = Jarvis::Interpreter.new(params)
  message = Slack::Message.new(params)
  service = interpreter.determine_service.new(message)
  begin
    service.run
    json text: service.say
  rescue => e
    json text: "I'm sorry, #{message.user_name}, something went wrong, #{e.message}"
  end
end
