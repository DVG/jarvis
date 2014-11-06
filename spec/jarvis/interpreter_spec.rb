require 'spec_helper'

describe Jarvis::Interpreter do

  context "Service Routing" do
  
    describe "Routes gif requests to the GIF service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, a gif please") }
      subject { described_class.new(params) }
      it "Returns the GIF Service constant" do
        expect(subject.determine_service).to eq Jarvis::Services::GifService
      end
    end

    describe "Routes GIF requests to the GIF service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, a GIF please") }
      subject { described_class.new(params) }
      it "Returns the GIF Service constant" do
        expect(subject.determine_service).to eq Jarvis::Services::GifService
      end
    end

    describe "Routes success kid requests to the MemeGenerator service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, success kid:") }
      subject { described_class.new(params) }
      it "Returns the MemeGeneratorService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::MemeGeneratorService
      end
    end

    describe "Routes Success Kid requests to the MemeGenerator service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, Success Kid:") }
      subject { described_class.new(params) }
      it "Returns the MemeGeneratorService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::MemeGeneratorService
      end
    end

    describe "Routes FACT requests to the Fact service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, Fact") }
      subject { described_class.new(params) }
      it "Returns the FactService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::FactService
      end
    end

    describe "Routes rude requests to the rude service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, fuck off") }
      subject { described_class.new(params) }
      it "Returns the FactService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::RudeService
      end
    end
    
    describe "Route dice rolls to Dice Service" do
      let(:params) { slack_outgoing_message(text: "Jarvis, roll 2d20") }
      subject { described_class.new(params) }
      it "Returns the DiceService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::DiceService
      end
    end
  end

end
