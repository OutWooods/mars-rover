require './src/robot.rb'

class ControlCenter
  attr_reader :map, :robots

  def initialize(map_axis, robot_class = Robot)
    map_coordinates = map_axis.split(' ')
    @map = { x: map_coordinates[0].to_i, y: map_coordinates[1].to_i }
    @robot_class = robot_class
    @robots = []
  end

  def start_robot(instructions)
    robot_setup = instructions.split(')')

    robot = @robot_class.new(@map, format_start_position(robot_setup[0]))
    robot.move(robot_setup[1].strip) unless robot_setup[1].nil?
    @robots.push(robot)
  end

  private

  def format_start_position(setup_details)
    details = setup_details[1..-1].split(',')
    { x: details[0].to_i, y: details[1].to_i, direction: details[2].strip }
  end
end
