class Booking
    attr_accessor :backpacker, :hostel, :month

    @@all = []

    def initialize(month, backpacker, hostel)
        @month = month
        @backpacker = backpacker
        @hostel = hostel
        save_booking
    end

    def save_booking
        @@all << self
    end

    def self.all
        @@all
    end
end