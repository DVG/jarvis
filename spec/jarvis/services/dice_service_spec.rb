require 'spec_helper'


describe Jarvis::Services::DiceService do
  describe "#roll" do
    context "2d6" do
      let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis roll 2d6")) }
      subject { described_class.new(message) }
      before  { allow(Random).to receive_messages(rand: 1) }
      it { expect(subject.send(:roll)).to eq 2 }
    end
    context "1d20" do
      let(:message) { Slack::Message.new(slack_outgoing_message(text: "Jarvis roll 1d20")) }
      subject { described_class.new(message) }
      before  { allow(Random).to receive_messages(rand: 20) }
      it { expect(subject.send(:roll)).to eq 20 }
      
    end
  end
end
