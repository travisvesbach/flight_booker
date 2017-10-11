class Flight < ApplicationRecord
  	belongs_to :from_airport, class_name: "Airport"
  	belongs_to :to_airport, class_name: "Airport"
  	has_many :bookings

  	validates :from_airport, presence: true
  	validates :to_airport, presence: true
  	validates :departure, presence: true

  	def self.search(departing, arriving, date)
  		Flight.where(from_airport: departing, to_airport: arriving, departure: find_date(date))
  	end

  	def self.get_dates
  		date = Flight.all.order(departure: :asc)
  		date.map { |flight| flight.departure.strftime("%b %d %Y") }.uniq
  	end


  	private 

  		def self.find_date(date)
  			date = date.to_date
  			date.beginning_of_day..date.end_of_day
  		end



end
