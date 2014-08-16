module BikeContainer

	# attr_writer :capacity

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||=[]
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "nothing to dock" if bike == nil
		not_bike(bike)
		raise "Station is full" if full?
		bikes << bike
	end

	def release(bike)
		not_bike(bike)
		raise "bike not specified" if bike == nil
		raise "bike not available" if available_bikes.count == 0
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def empty?
		return false if bike_count > 0
		return true if bike_count == 0
	end

	def not_bike(bike)
		raise "this is not a bike" unless bike.is_a? Bike
	end

	def broken_bikes
		bikes.count {|bike| bike.broken?}
	end

end