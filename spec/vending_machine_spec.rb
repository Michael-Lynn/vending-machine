require 'vending_machine'

describe VendingMachine do

	let(:crisps) {Product.new("Crisps", 2.5)}
	let(:chocolate) { Product.new("Chocolate", 0.5)}
	let(:products) { [crisps, chocolate]}
	let(:customer) { Customer.new }
	let(:vending_machine) {vending_machine = VendingMachine.new(products, 50) }

	it 'is initialized with a list of products and some money' do 
		expect(vending_machine.products).to eq products
		expect(vending_machine.total_money).to eq 50
	end

	it 'when the customer has ordered correctly, has more money and no longer that product' do
		customer.buy product: "Crisps", at: vending_machine, with: 2.5
		expect(vending_machine.products.count).to eq 1
		expect(vending_machine.total_money).to eq 52.5
	end

	it 'alerts the customer if has paid too little' do 
		expect(STDOUT).to receive(:puts).with "Not enough money inserted"
		customer.buy product: "Crisps", at: vending_machine, with: 0.5
		expect(vending_machine.products.count).to eq 2
		expect(vending_machine.total_money).to eq 50
	end



end