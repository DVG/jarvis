require 'spec_helper'
require 'json'

describe "App" do
  def app
    Sinatra::Application
  end

  it "Says hello" do
    get "/"
    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)
    expect(response["text"]).to eq "Hello, I'm Jarvis"
  end
end
