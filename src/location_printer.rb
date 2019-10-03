class LocationPrinter
  def print(robots)
    robots.each do |robot|
      location = robot.location
      puts "(#{location[:x]}, #{location[:y]}, #{location[:direction]})"
    end
  end
end
