require 'spec_helper'

describe MemeGenerator::SuccessKid do
  context "two words" do
    subject { described_class.new("Jarvis success kid does this work, yes it does") }
    before { allow(HTTParty).to receive_messages(:get => true) }
    it "Tokenizes the input" do
      subject.get
      expect(subject.text0).to eq "does this work"
      expect(subject.text1).to eq "yes it does"
    end
  end

  context "one line" do
    subject { described_class.new("Jarvis success kid does this work yes it does") }
    before { allow(HTTParty).to receive_messages(:get => true) }
    it "Tokenizes the input" do
      subject.get
      expect(subject.text0).to eq "does this work yes it does"
      expect(subject.text1).to eq ""
    end
  end

end
