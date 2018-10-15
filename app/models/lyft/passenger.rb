class Passenger

  attr_reader :distance, :driver, :passenger

  @@all = []
  @@premium = []

  def initialize(passenger)
    @passenger = passenger
    @@all << self
  end

  def self.all
    @@all
  end

  def self.add_premium_member
    inductees = @@all.select {|passengers| passengers.total_distance > 100.0}
    inductees.each {|inductee| @@premium << inductee}
    inductees
  end

  def self.premium_members
    @@premium
  end

  def drivers
    pilots = []
    self.rides.select {|rides| rides.driver}.each {|drivers| pilots << drivers.driver}
    pilots.uniq
  end

  def rides
    Ride.all.select {|rides| rides.passenger == self.passenger}
  end

  def total_distance
    total_distance = 0
    self.rides.each {|rides| total_distance += rides.distance}
    total_distance
  end

end
