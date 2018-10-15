class Guest

  attr_reader :guest, :guest_name

  @@all = []

  def initialize(guest)
    @guest = guest
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_guest_by_name(name)
    @@all.find {|guest| guest.guest == name}
  end

  def self.pro_traveller
    pros = []
    Guest.all.select {|guest| guest.trip_count > 1}.each do |people|
      pros << people.guest
    end
    pros
  end

  def self.find_all_by_name(name)
    @@all.select {|person| person.guest == name}
  end

  def trips
    renter = Guest.find_guest_by_name(self.guest)
    Trip.all.select {|trips| trips.guest == renter}
  end

  def trip_count
    renter = Guest.find_guest_by_name(self.guest)
    Trip.all.select {|trips| trips.guest == renter}.size
  end

  def listings
    guest_listings = []
    Trip.all.select {|trip| trip.guest_name == self.guest}.each do |guest_trips|
      guest_listings << guest_trips.city
    end
    guest_listings.uniq
  end
  
end
