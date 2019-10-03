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

    it 'moves down one if told F and is facing S' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'S')

      robot.move('F')

      expect(robot.location).to eq(x: 1, y: 0, direction: 'S')
    end

    it 'moves left (negative x) one if told F and is facing W' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'W')

      robot.move('F')

      expect(robot.location).to eq(x: 0, y: 1, direction: 'W')
    end

    it 'rotates to W from N if it is told to turn left' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'N')

      robot.move('L')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'W')
    end

    it 'rotates to S from W if it is told to turn left' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'W')

      robot.move('L')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'S')
    end

    it 'rotates to E from S if it is told to turn left' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'S')

      robot.move('L')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'E')
    end

    it 'rotates to N from E if it is told to turn left' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'E')

      robot.move('L')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'N')
    end

    it 'rotates to E from N if it is told to turn right' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'N')

      robot.move('R')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'E')
    end
  end
end
