class PassengerMailer < ApplicationMailer
	default from: 'booking@example.com'

	def thank_you(passenger, id)
		@passenger = passenger
		@url = "https://fierce-cliffs-16944.herokuapp.com/bookings/#{id}"
		mail(to: @passenger.email, subject: 'Flight booked')
	end
end
