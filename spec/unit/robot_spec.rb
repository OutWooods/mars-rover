require './src/robot.rb'

describe Robot do
  describe 'initialize' do
    it 'stores the map given to it' do
      robot = Robot.new(x: 1, y: 1)

      expect(robot.map).to eq(x: 1, y: 1)
    end
  end
end
