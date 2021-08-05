require "./lib/journey.rb"
describe Journey do
  subject(:journey){described_class.new("Paddington")}
  context "when instantiated" do
    it "journey should return as :from  the passed parameter station" do
      expect(journey.from).to eq("Paddington")
    end
  end
  context "at touch out" do
    it "journey should return as :to the passed paramater station" do
      journey.complete_journey("Finchley")
      expect(journey.to).to eq("Finchley")
    end
  end
  
  context "after touch_in and touch_out" do   
    it "checks to see if journey is complete" do
      journey.complete_journey("Finchley")
      expect(journey.complete?).to eq true
    end
  end

  describe '#fare' do
  
    it "" do

    end

end