require 'vending_machine'

describe VendingMachine do 

	it 'is initialized with a list of products' do 
		products = [Product.new("Crisps", 2.5), Product.new("Chocolate", 0.5)]
		vending_machine = VendingMachine.new(products)
		expect(vending_machine.products).to eq products
	end

end