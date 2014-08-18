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

	# def bike_count
	# 	bikes.count
	# end

	def dock(bike)
		raise "no bike to dock"  unless bike.is_a? Bike
		raise "Station is full" if full?
		bikes << bike
	end

	def release(bike)
		raise "bike not specified" unless bike.is_a? Bike
		raise "bike not available" if bikes.empty?
		bikes.delete(bike)
	end

	def full?
		available_bikes.count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def empty?
		return false if available_bikes.count > 0
		return true if available_bikes.count == 0
	end


	def broken_bikes
		bikes.select {|bike| bike.broken?}
	end

end