require './lib/bike_container'
require './lib/exception'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }
	let(:working_bike) { Bike.new}
	let(:broken_bike) { Bike.new.break! }

	def fill_holder(holder)
		holder.capacity.times {holder.dock(Bike.new)}
	end

	it "should accept a bike" do	
		expect(holder.available_bikes.count).to eq(0)
		holder.dock(bike)
		expect(holder.available_bikes.count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.available_bikes.count).to eq(0)
	end

	it "should know when it's full" do 
	 	expect(holder).not_to be_full
	 	fill_holder holder
	 	expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder
		expect{holder.dock(bike)}.to raise_error "Sorry! This holder is full."
	end

	it "should provide the list of available bikes" do
		broken_bike 
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should not dock something that is not a bike" do
		expect(holder.dock(:apple)).to eq "This is not a bike"
	end

	it "should not release a bike when container holder is empty" do
		expect(holder.empty?).to be true
		expect((holder.release(bike))).to eq "Sorry! This holder is empty."
	end

	it "should check how many broken bikes are available" do
		brokenbike2 = working_bike.break!
		broken_bike
		holder.dock(brokenbike2)
		holder.dock(broken_bike)
		expect(holder.broken_bikes.count).to eq 2
	end

end