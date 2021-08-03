CARD_LIMIT = 90
MINIMUM_FARE = 1

class Oystercard
  attr_reader :balance, :entry_station, :exit_station
  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    
    @balance += amount
  end

  def in_journey?
    !entry_station.nil?
  end

  def touch_in(station)
    raise "Insufficient funds, please top up" if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    self.deduct
    @entry_station = nil
    @exit_station = station
  end

  private

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end


end