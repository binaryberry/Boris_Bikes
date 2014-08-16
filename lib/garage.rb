require_relative 'bike_container'
require_relative 'bike'

class Garage

	include BikeContainer
	
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	alias_method :old_dock, :dock

	def dock(bike)
		bike.fixed!
		old_dock(bike)
	end

end