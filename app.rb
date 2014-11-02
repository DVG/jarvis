# Load Path
$: << File.expand_path('../', __FILE__)
require 'sinatra'
require "sinatra/json"
require 'json'
require 'jarvis'

get "/" do
  json text: "Hello, I'm Jarvis"
end
