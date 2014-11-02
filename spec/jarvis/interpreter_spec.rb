require 'spec_helper'

describe Jarvis::Interpreter do
  describe "Routes cat gif requests to the GIF service" do
    let(:params) { {"text" => "Jarvis, a cat gif please" } }
    subject { described_class.new(params) }
    it "Returns the GIF Service constant" do
      expect(subject.determine_service).to eq Jarvis::Services::GifService
    end
  end
end
