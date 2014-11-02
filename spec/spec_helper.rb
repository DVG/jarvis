ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'rspec'
require 'rack/test'
include Rack::Test::Methods
