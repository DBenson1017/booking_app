require 'pry'

class Hostel
    attr_accessor :country, :price, :rooms, :available_months, :status

    @@all = []

    #each new instance of Hostel shoule initialize with a:
    #country (String), price (Integer), number of available rooms (Integer)
    #and a list of months it is open during (Array), and an automatic status of 'vacany' (String)
    def initialize(country, price, rooms, available_months, status='vacancy')
        @country = country
        @price = price
        @rooms = rooms
        @available_months = available_months
        @status = status
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

    def new_booking(month, backpacker)
        if backpacker.budget >= self.price && open?
            backpacker.budget -= self.price
            self.rooms -= 1
            if self.rooms == 0
                self.status = 'no vacancy'
            end
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

    def open?(month)
        self.available_months.include? month
    end

end
