require 'spec_helper'

describe Jarvis::Services::MemeGeneratorService do
  let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis, success kid: hello, world")) }
  subject { described_class.new(message) }
  it { expect(subject.meme_class).to eq MemeGenerator::SuccessKid }
end
