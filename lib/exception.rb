class NotABikeError < StandardError
	def message
		"This is not a bike"
	end
end

class EmptyHolderError < Exception
	def initialize(message: "Blah")
		super(message)
	end
end

class FullHolderError < Exception
	def initialize(message: "Blah")
		super(message)
	end
end
