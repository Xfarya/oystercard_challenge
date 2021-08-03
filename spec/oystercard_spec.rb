require 'oystercard'

describe Oystercard do

  let (:station) { double(:station) }

  before do
    @card1 = Oystercard.new
  end


  it 'checks that a card has an initial balance of 0' do
    expect(@card1.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up) }
  it { is_expected.to respond_to(:in_journey?) }
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:touch_out) }

  describe "#top_up" do
    it "adds the top up amount to the balance" do
      @card1.top_up(10)
      expect(@card1.balance).to eq(10)
    end

    it "adds the top up amount on top of the existing balance" do
      @card1.top_up(10)
      @card1.top_up(20)
      expect(@card1.balance).to eq(30)
    end

    it "does not allow you to #top_up beyond #{CARD_LIMIT}" do
      @card1.top_up(50)
      expect { @card1.top_up(60) }.to raise_error "Unable to top up 60, balance would exceed card limit of #{CARD_LIMIT}"
    end
  end

  describe "#in_journey" do
    it "return true or false" do
      expect(@card1.in_journey?).to be(true).or be(false)
    end
  end

  describe "#touch_in" do
    it "expect touch_in to update #in_journey" do
      @card1.top_up(10)
      @card1.touch_in(station)
      expect(@card1.in_journey?).to eq(true)
    end
    
    it "does not allow touch in when balance is below minimum fare" do
      expect { @card1.touch_in(station) }.to raise_error "Insufficient funds, please top up"
    end

    it "records the entry station of the journey" do
      @card1.top_up(10)
      @card1.touch_in(station)
      expect(@card1.entry_station).to eq(station)
    end
  end

  describe "#touch_out" do
  it "expect touch_out to update #in_journey" do
    @card1.touch_out
    expect(@card1.in_journey?).to eq(false)
  end

  it "is expected to deduct funds from balance when touch_out is called" do
    expect { @card1.touch_out }.to change { @card1.balance }.by(-1)
  end
end

end
