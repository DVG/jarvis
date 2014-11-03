# Load Path
$: << File.expand_path('../', __FILE__)
require 'sinatra'
require "sinatra/json"
require 'json'
require 'jarvis'

get "/" do
  json text: "Hello, I'm Jarvis"
end

post "/jarvis" do
  interpreter = Jarvis::Interpreter.new(params)
  json text: interpreter.determine_service.new.run.say
end
