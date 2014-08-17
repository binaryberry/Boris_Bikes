require_relative 'bike_container'
require './lib/garage'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect(location,van)
		broken_bikes.times do |location, van| 
			location.release(broken_bike)
			van.dock(broken_bike)
		end
		puts "#{van.broken_bikes}"
	end

end
