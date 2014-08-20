require_relative 'bike_container'
require './lib/garage'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def collect(location)
		collect_broken(location) && return if location.class == 'DockingStation'
		collect_available(location) && return if location.class == 'Garage'
 	end

	def collect_available(location)
		location.available_bikes.each do |bike| 
			location.release(bike)
			self.dock(bike)
		end
	end
	

	def collect_broken(location)
		location.broken_bikes.each do |broken_bike| 
			location.release(broken_bike)
			self.dock(broken_bike)
		end
	end

	def drop_off(location)
		location.class
			drop_off_available(location) if 'DockingStation'
			drop_off_broken(location) if 'Garage'

	end

	def drop_off_available(location)
		self.available_bikes.each do |bike|
			self.release(bike)
			location.dock(bike)
		end
	end

	def drop_off_broken(location)
		self.broken_bikes.each do |bike|
			self.release(bike)
			location.dock(bike)
		end
	end

end
