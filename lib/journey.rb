class Journey
  attr_reader :from, :to
#   def initialize
#     @from = station_from
#   end

  def initiate_journey(station_from)
    if !@from.nil? && !complete?
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
    !@to.nil?
  end
end

# complete? Boolean

# no touch in - touch out - !touch_in.nil?
# touch in - no touch out - !touch_out.nil?

# journey.complete? = false