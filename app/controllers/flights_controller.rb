class FlightsController < ApplicationController
  	def index
  		@airport_info = Airport.all.map{ |airport| [airport.airport_info, airport.id] }
  		@passengers = [1,2,3,4]
  		@date = Flight.get_dates

  		if !params[:search].nil?
  			@search_results = search_params
  			puts @search_results
  			@flights = Flight.search(@search_results[:departing], @search_results[:arriving], @search_results[:date])
  			puts "FLIGHTS #{@flights} "
  		end
  	end


	private

	def search_params
		params.require(:search).permit(:departing, :arriving, :passengers, :date)
	end



end
