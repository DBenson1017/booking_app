require 'pry'

require_relative './models/backpacker.rb'
require_relative './models/booking.rb'
require_relative './models/hostel.rb'


usa = Hostel.new("USA", 10, 5, ["June", "July"])
brazil = Hostel.new("Brazil", 7, 2, ["September"])
japan = Hostel.new("Japan", 3, 15, ["December", "August"])
thailand = Hostel.new("Thailand", 12, 7, ["July", "August", "September"])

ian = Backpacker.new("Ian", 50)
cody = Backpacker.new("Cody", 20)
david = Backpacker.new("David", 20)

binding.pry