require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }
	let(:working_bike) { Bike.new}
	let(:broken_bike) { Bike.new.break! }

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new)}
	end

	it "should accept a bike" do	
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do 
	 	expect(holder).not_to be_full
	 	fill_holder holder
	 	expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda { holder.dock(bike)}).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		broken_bike # reminder - documentation missing exclamation mark
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end
	
	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do 
	 	expect(holder).not_to be_full
	 	fill_holder holder
	 	expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect(lambda { holder.dock(bike)}).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		broken_bike
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should not release a bike that is not there" do
		expect( lambda{holder.release(bike)}).to raise_error("bike not available")
	end

	it "should not release a bike when passed an argument that is not a bike at all" do
		expect( lambda{holder.release(:dog)}).to raise_error("this is not a bike")
	end

	it "should not dock a bike that is not there" do
		bike = nil
		expect( lambda{holder.dock(bike)}).to raise_error("nothing to dock")
	end
	it "should not dock something that is not a bike" do
		expect( lambda{holder.dock(:apple)}).to raise_error("this is not a bike")
	end

	it "should not release a bike when container holder is empty" do
		holder.dock(bike)		
		expect(holder.empty?).to be false
		holder.release(bike)
		expect(holder.empty?).to be true
		expect(lambda { holder.release(bike)}).to raise_error("bike not available")
	end

	it "should check how many broken bikes are available" do
		working_bike.break!
		broken_bike
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq(2)
	end

end