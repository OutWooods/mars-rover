describe 'use multiple rovers' do
  it 'two rovers can move successfully' do
    control_center = ControlCenter.new('4 8')
    control_center.start_robot('(0, 2, N) FFRFRFF')
    control_center.start_robot('(2, 3, N) FLLFR')

    expected_message = "(1, 2, S)\n(2, 3, W)\n"
    expect { control_center.robot_locations }.to output(expected_message).to_stdout
  end

  it 'two rovers can get marked as lost' do
    control_center = ControlCenter.new('4 8')
    control_center.start_robot('(1, 0, S) FLLFR')
    control_center.start_robot('(2, 3, N) FFFFRFFF')

    expected_message = "(1, 0, S) LOST\n(4, 7, E) LOST\n"
    expect { control_center.robot_locations }.to output(expected_message).to_stdout
  end
end
