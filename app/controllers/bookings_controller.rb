class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		@recieved_info = get_params
		@flight = Flight.find_by(id: @recieved_info[:flight_id])
		@recieved_info[:passengers].to_i.times { @booking.passengers.build }
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			flash[:success] = 'Your flight has been booked!'
			redirect_to @booking
		else
			flash[:danger] = 'Unable to complete transatcion.  Was your information entered corrently?'
			redirect_to new_booking_path(request.parameters)
		end
	end

	def show
		@booking = Booking.find_by(id: params[:id])
	end

	private

		def get_params
			if !params[:choose_flight].nil?
				params.require(:choose_flight).permit(:flight_id, :passengers)
			else
				params.require(:booking).permit(:flight_id, :passengers)
			end
		end

		def booking_params
			params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
		end

end
