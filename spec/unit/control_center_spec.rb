require './src/control_center.rb'

describe ControlCenter do
  describe 'initialize' do
    it 'saves the map with x and y coordinates' do
      control_center = ControlCenter.new('3 5')

      expect(control_center.map).to eq(x: 3, y: 5)
    end
  end
end
