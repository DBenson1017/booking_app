class Backpacker
    attr_accessor :name, :budget

    @@all = []

    def initialize(name, budget=15)
        @name = name
        @budget = budget
        save_backpacker
    end

    def save_backpacker
        @@all << self
    end

    def self.all
        @@all
    end

    def make_booking(month, hostel)
        if self.budget >= hostel.price && (hostel.available_months.include? month)
            self.budget -= hostel.price
            hostel.rooms -= 1
            Booking.new(month, self, hostel)
        elsif self.budget < hostel.price && (hostel.available_months.include? month)
            "Sorry. You need more cash."
        elsif self.budget >= hostel.price && (!hostel.available_months.include? month)
            "This hostel is not available during this time."
        else
            "Just find a new hostel."
        end
    end

    def my_hostels
        Booking.all.map do |booking| 
            if booking.backpacker == self
                booking.hostel 
            end
        end
    end
end