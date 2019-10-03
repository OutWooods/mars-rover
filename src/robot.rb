class Robot
  attr_reader :map, :location

  def initialize(map, location)
    @map = map
    @location = location
  end
end
