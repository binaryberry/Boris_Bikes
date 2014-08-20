class NotABikeError < StandardError
	def message
		"Oh god what have you done"
	end
end

class BikeNotSpecifiedError < StandardError
	def message
		"That is not a bike"
	end
end