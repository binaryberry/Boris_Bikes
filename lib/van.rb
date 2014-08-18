require_relative 'bike_container'
require './lib/garage'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect(location)
		location.broken_bikes.each do |broken_bike| 
			location.release(broken_bike)
			self.dock(broken_bike)
		end
	
	end

end
