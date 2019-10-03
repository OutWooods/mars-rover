require './src/robot_printer.rb'

describe RobotPrinter do
  describe 'print' do
    it 'calls location on all robots' do
      robot1 = double('robot')
      robot2 = double('robot')
      printer = RobotPrinter.new

      expect(robot1).to receive(:location).and_return({})
      expect(robot2).to receive(:location).and_return({})

      printer.print([robot1, robot2])
    end
  end
end
