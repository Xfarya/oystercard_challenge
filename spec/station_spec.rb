require 'station'

describe Station do

<<<<<<< HEAD
  let(:station) { Station.new("Farringdon", 1) }

  it "should give a name and zone on initialization" do
    expect([station.name, station.zone]).to eq ["Farringdon", 1]
    # expect(station.name).to eq "Farringdon"
    # expect(station.zone).to eq 1
  end

=======
  describe "#initialize" do

    let(:station) { described_class.new("Farringdon", 1) }

    it "check that new Station has correct name" do
      expect(station.name).to eq ('Farringdon')
    end

    it "check that new Station has correct zone" do
      expect(station.zone).to eq (1)
    end
  end



>>>>>>> cf0d8fc58cc72128b96033a10f93aa4810397846
end