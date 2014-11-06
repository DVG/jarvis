require 'spec_helper'

describe Jarvis::Services::StatsService do
  subject { described_class.new(message) }
  describe "#stats" do
    let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis stats please")) }
    it { expect(subject.send(:say)).to eq "A bunch of people said shit" }
  end
end
