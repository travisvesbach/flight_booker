# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Airport.create(name: "Hartsfield-Jackson Atlanta International Airport", code: "ATL", location: "Atlanta, GA")

Airport.create(name: "Los Angeles International Airport", code: "LAX", location: "Los Angeles, CA")

Airport.create(name: "O'Hare International Airport", code: "ORD", location: "Chicago, IL")

Airport.create(name: "Dallas/Fort Worth International Airport", code: "DFW", location: "Dallas/Fort Worth, TX")

Airport.create(name: "John F. Kennedy International Airport", code: "JFK", location: "New York, NY")

Airport.create(name: "Denver International Airport", code: "DEN", location: "Denver, CO")

Airport.create(name: "San Francisco International Airport", code: "SFO", location: "San Francisco, CA")

Airport.create(name: "McCarran International Airport", code: "LAS", location: "Las Vegas, NV")

Airport.create(name: "Seattle-Tacoma International Airport", code: "SEA", location: "Seattle/Tacoma, WA")

Airport.create(name: "Charlotte Douglas International Airport", code: "CLT", location: "Charlotte, NC")

flight_number = 1001
14.times do |n|
	puts "entering 14 times"
	date = "10/#{(12 + n)}/2017"
	Airport.take(9).each do |departing|
		Airport.all.each do |arriving|
			unless departing == arriving
				3.times do |t|
					puts "Entering #{t} times"
					puts departing
					puts departing.id
					puts arriving
					puts arriving.id
					puts DateTime.strptime("#{date} #{(8 + (t * 3))}:00", "%m/%d/%Y %H:%M")
					Flight.create(from_airport: departing, to_airport: arriving, departure: DateTime.strptime("#{date} #{(8 + (t * 3)).to_s}:00", "%m/%d/%Y %H:%M"), number: flight_number)
					flight_number +=1 
				end
			end
		end
	end
end
