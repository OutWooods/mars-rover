class ControlCenter
  attr_reader :map, :robots

  def initialize(map_axis, rover = '')
    map_coordinates = map_axis.split(' ')
    @map = { x: map_coordinates[0].to_i, y: map_coordinates[1].to_i }
    @roverClass = rover
    @robots = []
  end

  def start_robot(instructions)
    robot_setup = instructions.split(')')

    robot = @roverClass.new(robot_setup[0])
    robot.move(robot_setup[1].strip) unless robot_setup[1].nil?
    @robots.push(robot)
  end
end
