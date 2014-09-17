require 'customer'

describe Customer do 

	it 'starts off by having an empty satchel' do 
		customer = Customer.new
		expect(customer.satchel).to be_empty
	end


end