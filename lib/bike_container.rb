require './lib/exception'

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
		raise if !bike.is_a? Bike
		raise if full?
	rescue
		p "Oh god what have you done"
	else
		bikes << bike
	end

	def release(bike)
		raise if !bike.is_a? Bike
		raise if empty?
	rescue 
		p "Oh god what have you done"
	else
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