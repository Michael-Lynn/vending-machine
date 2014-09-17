require 'customer'

describe Customer do

	let(:crisps) {Product.new("Crisps", 2.5)}
	let(:chocolate) { Product.new("Chocolate", 0.5)}
	let(:products) { [crisps, chocolate]}
	let(:customer) { Customer.new 15 }
	let(:vending_machine) {vending_machine = VendingMachine.new(products, 50) }

	it 'starts off by having an empty satchel' do 
		expect(customer.satchel).to be_empty
	end

	it 'is initialized with money in his wallet' do 
		expect(customer.wallet).to eq 15
	end

	it 'when he correctly orders from the vending machine should have the item and less money' do 
		customer.buy product: "Crisps", at: vending_machine, with: 2.5
		expect(customer.satchel).to include crisps
		expect(customer.wallet).to eq 12.5
	end

end