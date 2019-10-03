require './src/control_center.rb'

describe ControlCenter do
  describe 'initialize' do
    it 'saves the map with x and y coordinates' do
      control_center = ControlCenter.new('3 5')

      expect(control_center.map).to eq(x: 3, y: 5)
    end
  end

  describe 'start_robot' do
    it 'creates a new rover when called' do
      rover = double('rover')
      expect(rover).to receive(:new).with({ x: 3, y: 4 }, x: 2, y: 3, direction: 'N').and_return(rover)

      control_center = ControlCenter.new('3 4', rover)
      control_center.start_robot('(2, 3, N)')
    end

    it 'stores each new rover' do
      rover = double('rover')
      allow(rover).to receive(:new).with({ x: 3, y: 4 }, x: 2, y: 3, direction: 'N').and_return(rover)

      control_center = ControlCenter.new('3 4', rover)
      control_center.start_robot('(2, 3, N)')

      expect(control_center.robots).to eq([rover])
    end

    it 'calls move on rover if it has instructions' do
      rover = double('rover')
      allow(rover).to receive(:new).with({ x: 3, y: 4 }, x: 2, y: 3, direction: 'N').and_return(rover)
      expect(rover).to receive(:move).with('FFLF')

      control_center = ControlCenter.new('3 4', rover)
      control_center.start_robot('(2, 3, N) FFLF')
    end
  end
end
