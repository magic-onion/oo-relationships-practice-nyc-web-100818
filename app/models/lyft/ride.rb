class Ride

  attr_accessor :passenger, :distance, :driver

  @@all = []

  def initialize(distance, driver=nil, passenger=nil)
    @distance = distance.to_f
    @passenger = passenger
    @driver = driver
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    total_distance = 0
    @@all.each {|ride| total_distance += ride.distance}
    all_trips = @@all.size
    total_distance.to_f/all_trips.to_f
  end

end
