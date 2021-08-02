require 'oystercard'

describe Oystercard do
  before do
    @card1 = Oystercard.new
  end

  it 'checks that a card has an initial balance of 0' do
    expect(@card1.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up) }

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

end
