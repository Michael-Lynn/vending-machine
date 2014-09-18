require 'customer'

describe Customer do

	before { STDOUT.stub(:puts)}

	it 'starts off by having an empty satchel' do 
		expect(customer.satchel).to be_empty
	end

	it 'is initialized with change in his wallet' do 
		expect(customer.wallet).to eq change
	end

	it 'when he correctly orders from the vending machine should have the item and less money' do 
		customer.buy product: "Crisps", at: vending_machine, with: {200 => 1, 50 => 1}
		expect(customer.satchel).to include crisps
		expect(customer.wallet[200]).to eq 0
		expect(customer.wallet[50]).to eq 0
	end

end