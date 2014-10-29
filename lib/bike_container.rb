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

	def dock(bike)	
		raise NotABikeError unless bike.is_a? Bike
		raise FullHolderError.new(message: "Sorry! This holder is full.") if full?
		rescue NotABikeError => e
		e.message
	else
		bikes << bike
	end

	def release(bike)
		begin
			raise NotABikeError unless bike.is_a? Bike
			raise EmptyHolderError.new(message: "Sorry! This holder is empty.") if empty?
		bikes.delete(bike)
		rescue NotABikeError => e
			e.message
		rescue EmptyHolderError => e
			 e.message
		end
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