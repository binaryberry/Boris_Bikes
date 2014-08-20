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

class EmptyHolderError < Exception
	def initialize(message: "Blah")
		super(message)
	end
end
