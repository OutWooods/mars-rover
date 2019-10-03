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

  describe 'move - single movements' do
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

    it 'rotates to S from E if it is told to turn right' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'E')

      robot.move('R')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'S')
    end

    it 'rotates to W from S if it is told to turn right' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'S')

      robot.move('R')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'W')
    end

    it 'rotates to N from W if it is told to turn right' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'W')

      robot.move('R')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'N')
    end
  end

  describe 'move - multiple movements' do
    it 'moving RRRR will result in the same start position' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'N')

      robot.move('RRRR')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'N')
    end

    it 'RL cancel each other out' do
      robot = Robot.new({ x: 3, y: 3 }, x: 1, y: 1, direction: 'N')

      robot.move('RL')

      expect(robot.location).to eq(x: 1, y: 1, direction: 'N')
    end

    it 'LFRFLFRF moves up twice and west twice' do
      robot = Robot.new({ x: 5, y: 5 }, x: 3, y: 1, direction: 'N')

      robot.move('LFRFLFRF')

      expect(robot.location).to eq(x: 1, y: 3, direction: 'N')
    end

    it 'starting west, LFFLFFLLF moves down twice and and east once' do
      robot = Robot.new({ x: 5, y: 5 }, x: 3, y: 2, direction: 'W')

      robot.move('LFFLFFLLF')

      expect(robot.location).to eq(x: 4, y: 0, direction: 'W')
    end
  end

  describe 'lost' do
    it 'robot should be marked as lost when it goes too far north' do
      robot = Robot.new({ x: 3, y: 3 }, x: 3, y: 3, direction: 'N')

      robot.move('F')

      expect(robot.lost?).to be true
    end

    it 'robot should be not marked as lost when it is within the grid' do
      robot = Robot.new({ x: 3, y: 4 }, x: 3, y: 3, direction: 'N')

      robot.move('F')

      expect(robot.lost?).to be false
    end

    it 'robot should be marked as lost when it is too southern grid' do
      robot = Robot.new({ x: 3, y: 4 }, x: 3, y: 0, direction: 'S')

      robot.move('F')

      expect(robot.lost?).to be true
    end

    it 'robot should be marked as lost when it is too east of the grid' do
      robot = Robot.new({ x: 3, y: 4 }, x: 3, y: 2, direction: 'E')

      robot.move('F')

      expect(robot.lost?).to be true
    end
  end
end
