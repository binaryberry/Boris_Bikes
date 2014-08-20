require './lib/exception'

describe NotABikeError do
	
	it "raises an exception" do
	expect{ raise NotABikeError }.to raise_exception(NotABikeError, "Oh god what have you done")
	end







end