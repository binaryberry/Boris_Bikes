class Person

	def initialize
		@rents_bike = false
	end

	def renting_bike?
		@rents_bike
	end

	def rents_bike!
		@rents_bike = true
	end

	def returns_bike!
		@rents_bike = false
	end

end 