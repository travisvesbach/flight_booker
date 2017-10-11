class Airport < ApplicationRecord
	has_many :departing_flights, foreign_key: :from_airport, class_name: "Flight"
	has_many :arriving_flights, foreign_key: :to_airport, class_name: "Flight"

	validates :name, presence: true
	validates :code, length: { is: 3 }, uniqueness: true, format: { with: /\A[a-zA-Z]{3}\z/ }
	validates :location, presence: true

	before_save :upcase_code

	def airport_info
		"#{self.name}(#{self.code}) - #{self.location}"
	end

	private

		def upcase_code
			self.code = code.upcase
		end
		
end
