require 'pry'

require_relative './models/backpacker.rb'
require_relative './models/booking.rb'
require_relative './models/hostel.rb'


usa = Hostel.new("USA", 10, 5)
brazil = Hostel.new("Brazil", 7, 2)
japan = Hostel.new("Japan", 3, 15)
thailand = Hostel.new("Thailand", 12, 7)

ian = Backpacker.new("Ian", 20)
cody = Backpacker.new("Cody", 20)
david = Backpacker.new("David", 20)

usa.add_month("June")
usa.add_month("July")
usa.add_month("August")
usa.add_month("September")


binding.pry