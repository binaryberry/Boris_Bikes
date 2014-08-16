# functionality of the Bike class
require 'bike'

describe Bike do 
	# this is a specific feature (behaviour)
	# that we expect to be present
	it "should not be broken after we create it" do
		the_bike = Bike.new #initialise a new object of Bike class
		# expect an instance of this class to have 
		# a method "broken?" that should return false
		expect(the_bike.broken?).to eq false
	end	

	it "bike breaks" do
		the_bike = Bike.new 
		the_bike.break!
		expect(the_bike.broken?).to eq true
	end

	it "bike fixed" do
		the_bike = Bike.new
		the_bike.break!
		the_bike.fixed!
		expect(the_bike.broken?).to eq false
	end

end
