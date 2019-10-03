class ControlCenter
  attr_reader :map

  def initialize(map_axis, rover = '')
    map_coordinates = map_axis.split(' ')
    @map = { x: map_coordinates[0].to_i, y: map_coordinates[1].to_i }
    @roverClass = rover
  end

  def start_robot(instructions)
    @roverClass.new(instructions)
  end
end
