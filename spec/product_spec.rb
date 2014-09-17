require 'product'

describe Product do 

	it 'is initialized with a name and a price' do 
		product = Product.new("Crisps", 250)
		expect(product.name).to eq "Crisps"
		expect(product.price).to eq 250
	end

end