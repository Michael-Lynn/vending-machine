require 'vending_machine'

describe VendingMachine do

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

	it 'is initialized with a list of products and some change' do 
		expect(vending_machine.products).to eq products
		expect(vending_machine.total_money).to eq change
	end

	it 'when the customer has ordered correctly, has more money and no longer that product' do
		customer.buy product: "Crisps", at: vending_machine, with: {200=>1, 50=>1}
		expect(vending_machine.products.count).to eq 1
		expect(vending_machine.total_money[200]).to eq 2
		expect(vending_machine.total_money[50]).to eq 2
	end

	it 'alerts the customer if has paid too little' do 
		expect(STDOUT).to receive(:puts).with "Not enough money inserted"
		customer.buy product: "Crisps", at: vending_machine, with: {50 => 1}
		expect(vending_machine.products.count).to eq 2
	end

	context 'dispensing change' do 

		# xit 'dispenses nothing if exact '

	end




end