class LocationPrinter
  def print(robots)
    robots.each do |robot|
      location = robot.location
      location_status = "(#{location[:x]}, #{location[:y]}, #{location[:direction]})"
      puts robot.lost? ? location_status + ' LOST' : location_status
    end
  end
end
