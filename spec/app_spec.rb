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

  it "Creates a gif" do
    post "/jarvis", slack_outgoing_message(text: "Jarvis, a gif please")
    expect(last_response).to be_ok
  end

  it "is polite" do
    post "/jarvis", slack_outgoing_message(text: "Jarvis, thanks")
    expect(last_response).to be_ok
  end

  it "responses to facts" do
    post "/jarvis", slack_outgoing_message(text: "Jarvis, FACT")
    expect(last_response).to be_ok
  end

  it "responses to facts" do
    post "/jarvis", slack_outgoing_message(text: "Jarvis, weather")
    expect(last_response).to be_ok
  end

  it "responds with NPH" do
    post "/jarvis", slack_outgoing_message(text: "Jarvis, suit up")
    expect(last_response).to be_ok
  end
end
