class Robot
  attr_reader :map, :location

  def initialize(map, location)
    @map = map
    @location = location
  end

  def move(_directions)
    forward
  end

  private

  def forward
    return @location[:x] += 1 if @location[:direction] == 'E'
    return @location[:y] -= 1 if @location[:direction] == 'S'
    return @location[:x] -= 1 if @location[:direction] == 'W'
    @location[:y] += 1
  end
end
