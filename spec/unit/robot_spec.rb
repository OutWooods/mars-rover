require './src/robot.rb'

describe Robot do
  describe 'initialize' do
    it 'stores the map given to it' do
      robot = Robot.new({ x: 1, y: 1 }, {})

      expect(robot.map).to eq(x: 1, y: 1)
    end

    it 'it stores the location given to it' do
      robot = Robot.new({ x: 1, y: 1 }, x: 1, y: 1, direction: 'N')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'N')
    end
  end

  describe 'move' do
    it 'moves upwards one if told F and is facing N' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'N')

      robot.move('F')

      expect(robot.location).to eq(x: 1, y: 2, direction: 'N')
    end

    it 'moves right one if told F and is facing E' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'E')

      robot.move('F')

      expect(robot.location).to eq(x: 2, y: 1, direction: 'E')
    end
  end
end
