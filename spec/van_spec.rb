require './lib/van.rb'
require './lib/bike_container.rb'

describe Van do 

	let(:van) { Van.new(:capacity => 50) }
	let(:bike) { Bike.new }
	let(:broken_bike) { Bike.new.break! }


	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(50)
	end

	it "should collect broken bikes from docking station" do
		broken_bike = Bike.new.break!
		van.dock(broken_bike)
		expect(lambda {dock(van.count)} == van.broken_bikes)
	end

	it "should only collect fixed bikes from garage" do
		van.dock(bike)
		expect(lambda {dock(van.count)} == van.available_bikes.count)
	end

	it "should know how many available bikes there are in the garage" do
		garage = Garage.new
		garage.dock(bike)
		expect(garage.available_bikes.count).to eq(1)	
	end

	it "should collect a broken bike from the docking station" do
		station = DockingStation.new
		station.dock(broken_bike)
		expect(van.collect(station,van)).to eq(1)
		# expect((station.broken_bikes).to eq (0)
	end




end