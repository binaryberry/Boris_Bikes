require 'person'

describe  Person do
 	it "rents a bike" do
 		the_person = Person.new
 		the_person.rents_bike!
 		expect(the_person.renting_bike?).to eq true
	end

	it "returns a bike" do
		the_person = Person.new
		the_person.rents_bike!
		the_person.returns_bike!
		expect(the_person.renting_bike?).to eq false
	end

end
