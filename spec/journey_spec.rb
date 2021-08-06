require "./lib/journey.rb"
describe Journey do
  subject(:journey){described_class.new}
  context "when we :initiate _journey" do
    it "journey should return as :from  the passed parameter station" do
      journey.initiate_journey("Paddington")
      expect(journey.from).to eq("Paddington")
    end
  end
  context "at touch out" do
    it "journey should return as :to the passed paramater station" do
      journey.initiate_journey("Paddington")
      journey.complete_journey("Finchley")
      expect(journey.to).to eq("Finchley")
    end
  end
  
  context "after touch_in and touch_out" do   
    # it "checks to see if journey is complete" do
    #   journey.initiate_journey("Paddington")
    #   journey.complete_journey("Finchley")
    #   expect(journey.complete?).to eq true
    #   expect 
    # end

    it "Removes minimum fare if journey is completed" do 
      journey.initiate_journey("Paddington")
      journey.complete_journey("Finchley")
      expect(journey.complete?).to eq(1)
    end 
  end

  context 'when we touch_in without touch_out' do
    it "penalty for if journey is incomplete" do
      journey.initiate_journey("Paddington")
      expect{ journey.initiate_journey("North Finchley") }.to raise_error "Incomplete journey, penalty applied"
    end
  end

  context 'when we touch_out without touch_in' do
    it "penalty for if journey is incomplete" do
      journey.initiate_journey("Paddington")
      journey.complete_journey("Paddington")
      expect{ journey.complete_journey("North Finchley") }.to raise_error "Incomplete journey, penalty applied"
    end
  end
end