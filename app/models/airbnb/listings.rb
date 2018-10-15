class Listing

  attr_reader :city, :rental_name, :trip_name, :guest_name

  @@all = []

  def initialize(rental_name, city)
    @rental_name = rental_name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_city(city_name)
    @@all.select {|listing| listing.city == city_name}
  end

  def self.most_popular
    trips_by_city = {}
    counter = 1
    Trip.all.each do |trip|
      if trips_by_city.has_key?(trip.city)
        counter += 1
        trips_by_city[trip.city] = counter
      else
        trips_by_city[trip.city] = counter
      end
    end
    trips_by_city.max_by {|city, trip_count| trip_count}[0]
  end

  def guests
    renters = []
    trips_at_listing = Trip.all.select {|trips| trips.rental_name == self.rental_name}
    trips_at_listing.each {|trips| renters << trips.guest.guest}
    renters
  end

  def trips
    Trip.all.select {|trips| trips.rental_name == self.rental_name}
  end

  def trip_count
    Trip.all.select {|trips| trips.rental_name == self.rental_name}.size
  end



end


# array of number of trips by city
# outputs a number for each listing
