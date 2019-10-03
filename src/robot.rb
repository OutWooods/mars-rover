class Robot
  attr_reader :map, :location

  def initialize(map, location)
    @map = map
    @location = location
  end

  def move(directions)
    return forward if directions === 'F'
    turn_left
  end

  private

  def forward
    return @location[:x] += 1 if @location[:direction] == 'E'
    return @location[:y] -= 1 if @location[:direction] == 'S'
    return @location[:x] -= 1 if @location[:direction] == 'W'
    @location[:y] += 1
  end

  def turn_left
    return @location[:direction] = 'S' if @location[:direction] == 'W'
    return @location[:direction] = 'E' if @location[:direction] == 'S'
    return @location[:direction] = 'N' if @location[:direction] == 'E'
    @location[:direction] = 'W'
  end
end
