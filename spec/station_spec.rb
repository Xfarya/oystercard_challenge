require 'station'

describe Station do

  describe "#initialize" do

    let(:station) { described_class.new("Farringdon", 1) }

    it "check that new Station has correct name" do
      expect(station.name).to eq ('Farringdon')
    end

    it "check that new Station has correct zone" do
      expect(station.zone).to eq (1)
    end
  end



end