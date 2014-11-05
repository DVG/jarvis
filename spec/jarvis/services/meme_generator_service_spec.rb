require 'spec_helper'

describe Jarvis::Services::MemeGeneratorService do
  let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis, success kid: hello, world")) }
  subject { described_class.new(message) }
  it { expect(subject.text0).to eq "hello" }
  it { expect(subject.text1).to eq "world" }
  it { expect(subject.meme_params).to eq "&generatorID=121&imageID=1031" }
end
