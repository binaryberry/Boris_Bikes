require 'person'



describe  Person do

let(:person) { Person.new		}

	it 'knows if it has a bike' do
		person.rents_bike!
		expect(person.has_bike?).to eq true
	end

	it 'knows if it has no bike' do
		expect(person.has_bike?).to eq false
	end	

end		
