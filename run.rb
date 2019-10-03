require './src/control_center.rb'

puts 'Enter your map in format [number number] e.g 4 8'
map = gets.chomp

control_center = ControlCenter.new(map)

instructions = ''

while instructions != 'END'
  puts 'Enter a rover and instructions to run - to finish type END'
  instructions = gets.chomp

  break if instructions == 'END'
  control_center.start_robot(instructions)
end

control_center.robot_locations

puts 'Thankyou! Goodbye.'
