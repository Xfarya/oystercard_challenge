class Journey
  attr_reader :from, :to
  def initialize(station_from)
    @from = station_from
  end

  def complete_journey(station_to)
    @to = station_to
  end
end