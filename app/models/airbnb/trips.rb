class Trip

  attr_accessor :trip_name

  attr_reader :rental_name, :guest_name

  @@all = []

  def initialize(trip_name, guest_name, rental_name)
    @trip_name = trip_name
    @guest_name = guest_name
    @rental_name = rental_name
    @@all << self
  end

  def self.all
    @@all
  end

  # finds the city a trip occurred in
  def city
    Listing.all.find {|rentals| self.rental_name == rentals.rental_name}.city
  end

  #finds the guest associated with a trip
  def guest
    Guest.all.find {|people| self.guest_name == people.guest}
  end

  def listing
    self.rental_name
  end

  def guest
    self.guest_name
  end

end
