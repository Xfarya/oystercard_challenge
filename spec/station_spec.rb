require 'station'

describe Station do

  let(:station) { Station.new("Farringdon", 1) }

  it "should give a name and zone on initialization" do
    expect([station.name, station.zone]).to eq ["Farringdon", 1]
    # expect(station.name).to eq "Farringdon"
    # expect(station.zone).to eq 1
  end

end