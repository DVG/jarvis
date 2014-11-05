require 'spec_helper'

describe Jarvis::Services::BaseService do
  let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis, hello", user_name: "Bradley", channel_name: "general")) }
  subject { described_class.new(message) }
  it { expect(subject.user_name).to eq "Bradley" }
  it { expect(subject.text).to eq "Jarvis, hello" }
  it { expect(subject.channel_name).to eq "general" }
end
