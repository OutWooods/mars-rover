class Robot
  attr_reader :map, :location

  def initialize(map, location)
    @map = map
    @location = location
  end

  def move(_directions)
    @location[:y] += 1
  end
end
