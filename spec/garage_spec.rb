require './lib/garage'



describe Garage do 

	let(:garage) { Garage.new(:capacity => 250) }
	let(:bike)   { Bike.new }


	it "should allow setting default capacity on initialising" do
		expect(garage.capacity).to eq(250)
	end

	it "should fix a bike" do
		bike.break!
		expect(bike.broken?).to eq true
		garage.dock(bike)
		expect(bike.broken?).to eq false
	end
	it "should know how many available bikes there are in the garage" do
		garage.dock(bike)
		expect(garage.available_bikes.count).to eq(1)	
	end
end