class Journey
  attr_reader :from, :to
  def initialize(station_from)
    @from = station_from
  end

  def complete_journey(station_to)
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