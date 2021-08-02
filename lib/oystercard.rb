
CARD_LIMIT = 90
class Oystercard
  attr_reader :balance
  def initialize
    @balance = 0
    @status = "not travelling"
  end

  def top_up(amount)
    raise "Unable to top up #{amount}, balance would exceed card limit of #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    return false if @status == "not travelling"
    return true if @status == "travelling"
  end

  def touch_in
    @status = "travelling"
  end

  def touch_out
    @status = "not travelling"
  end

end