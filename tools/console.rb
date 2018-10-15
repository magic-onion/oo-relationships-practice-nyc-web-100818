require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

########### var set for Airbnb
# hotel = Listing.new("hotel", "nyc")
# bnb = Listing.new("bnb", "chi")
# ota = Listing.new("ota", "nyc")
#
# alex = Guest.new("alex")
# jim = Guest.new("jim")
# alex2 = Guest.new("alex")
#
# wknd = Trip.new("wknd", "alex", "hotel")
# week = Trip.new("week", "alex", "bnb")
# thing = Trip.new("thing", "alex", "hotel")
# thing1 = Trip.new("thing1", "alex", "hotel")
# thing2 = Trip.new("thing2", "jim", "hotel")
# thing3 = Trip.new("thing3", "jim", "bnb")

########### var set for lyft
# ride1 = Ride.new(90, "driver", "alex")
# ride2 = Ride.new(26, "driver", "alex")
# ride3 = Ride.new(9)
# ride4 = Ride.new(15)
#
# driver = Driver.new("driver")
# alex = Passenger.new("alex")

########### var set for crowdfunding

## NEED TO TEST CROWDFUNDING ##

## create projects and pledges through users

alex = User.new("alex")
jim = User.new("jim")
internet = jim.add_project("internet", 1000)
new_internet = alex.add_project("new internet", 200)

jim_pledge = jim.add_pledge(150, "new internet")
alex_pledge = alex.add_pledge(1200, "internet")
jim_internet_pledge = jim.add_pledge(10, "internet")





Pry.start
