require 'sinatra'
require "sinatra/json"
require 'json'

get "/" do
  json text: "Hello, I'm Jarvis"
end
