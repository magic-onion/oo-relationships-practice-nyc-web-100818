class Driver

  attr_reader :distance, :passenger, :driver

  @@all = []

  def initialize(driver)
    @driver = driver
    @@all << self
  end

  def self.all
    @@all
  end

  def self.mileage_cap(distance)
    @@all.select {|drivers| drivers.total_distance > distance.to_f}
  end

  def passengers
    riders = []
    self.rides.select {|rides| rides.passenger}.each {|passengers| riders << passengers.passenger}
    riders.uniq
  end

  def rides
    Ride.all.select {|rides| rides.driver == self.driver}
  end

  def total_distance
    total_distance = 0
    self.rides.each {|rides| total_distance += rides.distance}
    total_distance.to_f
  end

end
