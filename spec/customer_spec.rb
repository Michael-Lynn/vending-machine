require 'customer'

describe Customer do

	let(:crisps) {Product.new("Crisps", 250)}
	let(:chocolate) { Product.new("Chocolate", 50)}
	let(:products) { [crisps, chocolate]}
	let(:change) {
		{
			1 => 1,
			2 => 1,
			5 => 1,
			10 => 1,
			20 => 1,
			50 => 1,
			100 => 1,
			200 => 1
		}
	}
	let(:customer) { Customer.new change }
	let(:vending_machine) {vending_machine = VendingMachine.new(products, change) }

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