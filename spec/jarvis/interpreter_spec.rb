require 'spec_helper'

describe Jarvis::Interpreter do

  context "Service Routing" do
  
    describe "Routes gif requests to the GIF service" do
      let(:params) { slack_outgoing_message("Jarvis, a gif please") }
      subject { described_class.new(params) }
      it "Returns the GIF Service constant" do
        expect(subject.determine_service).to eq Jarvis::Services::GifService
      end
    end

    describe "Routes GIF requests to the GIF service" do
      let(:params) { slack_outgoing_message("Jarvis, a GIF please") }
      subject { described_class.new(params) }
      it "Returns the GIF Service constant" do
        expect(subject.determine_service).to eq Jarvis::Services::GifService
      end
    end

    describe "Routes success kid requests to the MemeGenerator service" do
      let(:params) { slack_outgoing_message("Jarvis, success kid") }
      subject { described_class.new(params) }
      it "Returns the MemeGeneratorService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::MemeGeneratorService
      end
    end

    describe "Routes Success Kid requests to the MemeGenerator service" do
      let(:params) { slack_outgoing_message("Jarvis, Success Kid") }
      subject { described_class.new(params) }
      it "Returns the MemeGeneratorService constant" do
        expect(subject.determine_service).to eq Jarvis::Services::MemeGeneratorService
      end
    end

  end

end
