class Robot
  attr_reader :map, :location

  def initialize(map, location)
    @map = map
    @location = location
  end

  def move(directions)
    return forward if directions === 'F'
    return @location[:direction] = 'S' if (directions === 'L') && (@location[:direction] == 'W')
    return @location[:direction] = 'E' if (directions === 'L') && (@location[:direction] == 'S')
    return @location[:direction] = 'N' if (directions === 'L') && (@location[:direction] == 'E')
    @location[:direction] = 'W'
  end

  private

  def forward
    return @location[:x] += 1 if @location[:direction] == 'E'
    return @location[:y] -= 1 if @location[:direction] == 'S'
    return @location[:x] -= 1 if @location[:direction] == 'W'
    @location[:y] += 1
  end
end
