require './lib/exception'

describe NotABikeError do
	
	it "raises an exception" do
	expect{ raise NotABikeError }.to raise_exception(NotABikeError, "This is not a bike")
	end
end
