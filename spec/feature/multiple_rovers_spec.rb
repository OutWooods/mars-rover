describe 'use multiple rovers' do
  it 'two rovers can move successfully' do
    control_center = ControlCenter.new('4 8')
    control_center.start_robot('(0, 2, N) FFLFRFF')
    control_center.start_robot('(2, 3, N) FFLRF')

    expected_message = '(1, 2, N)/n(2, 3, W)'
    expect { control_center.robot_locations }.to output(expected_message).to_stdout
  end
end
