require 'oystercard'

describe Oystercard do
  before do
    @card1 = Oystercard.new
  end

  it 'checks that a card has an initial balance of 0' do
    expect(@card1.balance).to eq(0)
  end

  it { is_expected.to respond_to(:top_up) }  
  
end
