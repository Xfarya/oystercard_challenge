class Journey
  attr_reader :from, :to, :fare
   def initialize
     #@from = station_from
     @fare = 0
   end

  def initiate_journey(station_from)
    if !@from.nil? && !complete?
      # apply penalty
      raise "Incomplete journey, penalty applied"
    end
    @from = station_from
  end 

  def complete_journey(station_to)
    if @from.nil? || complete?
        raise "Incomplete journey, penalty applied"
    end
    @to = station_to
  end

  def complete?
    # to charge min fare
    if !@to.nil? && !@from.nil?
      @fare += 1 
    else 
      false
    end
  end
end

# Fare will return amount to be charged to card on completion of journey 
# Or when a penatly needs applied

# complete? Boolean

# no touch in - touch out - !touch_in.nil?
# touch in - no touch out - !touch_out.nil?

# journey.complete? = false