require './lib/van.rb'
require './lib/bike_container.rb'
require './lib/docking_station'
require './lib/garage'


describe Van do 

	let(:van) 			{ Van.new(:capacity => 50) 	}
	let(:bike) 			{ double :bike, {:broken? => false, :is_a? => Bike}}
	let(:broken_bike)	{ Bike.new.break! 			}


	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(50)
	end

	it "should collect broken bikes from the docking station" do
		station = double :station
		expect(station).to receive(:class).and_return('DockingStation')
		expect(station).to receive(:dock).with(broken_bike).and_return([broken_bike])
		expect(station).to receive(:broken_bikes).and_return([broken_bike])
		expect(station).to receive(:release).with(broken_bike).and_return([broken_bike])
		station.dock(broken_bike)
		van.collect(station)
		expect(van.broken_bikes.count).to eq(1)
	end

	it "should drop off working bikes to docking station" do 
		station = double :station
		expect(station).to receive(:dock)
		van.dock(bike)
		van.drop_off(station)
	end

	it "should collect working bikes from garage" do
		garage = double :garage
		expect(garage).to receive(:class).twice.and_return('Garage')
		expect(garage).to receive(:release).and_return(:bike)
		expect(garage).to receive(:available_bikes).and_return([bike])
		van.collect(garage)
		expect(van.available_bikes.count).to eq 1
	end

	it "should drop off broken bikes to the garage" do
		garage = double :garage
		expect(garage).to receive(:class).and_return('Garage')
		expect(garage).to receive(:dock).and_return(:bike)
		van.dock(broken_bike)
		van.drop_off(garage)
	end



end