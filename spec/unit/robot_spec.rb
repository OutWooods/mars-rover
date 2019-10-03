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
end
