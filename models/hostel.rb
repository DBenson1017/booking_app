require 'pry'

class Hostel
    attr_accessor :country, :price, :rooms, :available_months

    @@all = []

    def initialize(country, price, rooms)
        @country = country
        @price = price
        @rooms = rooms
        @available_months = []
        save_hostel
    end

    def save_hostel
        @@all << self
    end

    def self.all
        @@all
    end

    def room_price
        self.price
    end

    def add_month(month)
        self.available_months << month
    end

    def new_booking(month, backpacker)
        if backpacker.budget >= self.price && (self.available_months.include? month)
            backpacker.budget -= self.price
            self.rooms -= 1
            Booking.new(month, backpacker, self)
        else
            "Either this person cannot afford your hostel or you have no availablity for this month."
        end
    end

    def my_bookings
        Booking.all.select do |booking| 
            booking.hostel == self
        end
    end

    def my_backpackers
        array_of_backpackers = []
        my_bookings.each do |booking|
            array_of_backpackers << booking.backpacker
        end
        array_of_backpackers
    end

    def bookings_in_month(month)
        my_bookings.select do |booking|
            booking.month == month
        end
    end


end
