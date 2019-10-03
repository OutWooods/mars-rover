class RobotPrinter
  def print(robots)
    robots.each(&:location)
  end
end
