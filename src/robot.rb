class Robot
  attr_reader :map, :location

  DIRECTION_RULES = {
    'N' => { axis: :y, change: 1, to_left: 'W', to_right: 'E' },
    'E' => { axis: :x, change: 1, to_left: 'N', to_right: 'S' },
    'S' => { axis: :y, change: -1, to_left: 'E', to_right: 'W' },
    'W' => { axis: :x, change: -1, to_left: 'S', to_right: 'N' }
  }.freeze

  def initialize(map, location, direction_rules = DIRECTION_RULES)
    @map = map
    @location = location
    @direction_rules = direction_rules
  end

  def move(directions)
    directions.split('').each do |direction|
      forward if direction === 'F'
      turn_left if direction === 'L'
      turn_right if direction === 'R'
    end
  end

  def lost?
    @location[:y] > @map[:y] || @location[:y] < 0 || @location[:x] > @map[:x]
  end

  private

  def current_rules
    @direction_rules[@location[:direction]]
  end

  def forward
    @location[current_rules[:axis]] += current_rules[:change]
  end

  def turn_left
    @location[:direction] = current_rules[:to_left]
  end

  def turn_right
    @location[:direction] = current_rules[:to_right]
  end
end
