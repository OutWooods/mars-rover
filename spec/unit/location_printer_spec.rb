require './src/location_printer.rb'

describe LocationPrinter do
  describe 'print' do
    it 'calls location on all robots' do
      robot1 = double('robot')
      robot2 = double('robot')
      printer = LocationPrinter.new

      expect(robot1).to receive(:location).and_return({})
      expect(robot2).to receive(:location).and_return({})
      expect(robot1).to receive(:lost?).and_return(false)
      expect(robot2).to receive(:lost?).and_return(false)

      printer.print([robot1, robot2])
    end

    it 'prints the location of a robot' do
      robot = double('robot')
      printer = LocationPrinter.new

      expect(robot).to receive(:location).and_return(x: 1, y: 2, direction: 'N')
      expect(robot).to receive(:lost?).and_return(false)

      expect { printer.print([robot]) }.to output("(1, 2, N)\n").to_stdout
    end

    it 'prints lost if a robot is lost' do
      robot = double('robot')
      printer = LocationPrinter.new

      expect(robot).to receive(:location).and_return(x: 1, y: 2, direction: 'N')
      expect(robot).to receive(:lost?).and_return(true)

      expect { printer.print([robot]) }.to output("(1, 2, N) LOST\n").to_stdout
    end
  end
end
