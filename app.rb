# Load Path
$: << File.expand_path('../', __FILE__)
require 'sinatra'
require "sinatra/json"
require 'json'
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
  service.run
  json text: service.say
end
