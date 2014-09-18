require 'vending_machine'

describe VendingMachine do

	context 'when initialized' do 

		it 'has a list of products and some change' do 
			expect(vending_machine.products).to eq products
			expect(vending_machine.total_money).to eq change
		end

	end

	context 'when the customer has ordered correctly' do 
		before { customer.buy product: "Crisps", at: vending_machine, with: {200=>1, 50=>1} }

		it 'has more money' do 
			expect(vending_machine.total_money[200]).to eq 2
			expect(vending_machine.total_money[50]).to eq 2	
		end

		it 'no longer has that product' do 
			expect(vending_machine.products.count).to eq 1	
		end
	end

	context 'if the customer has paid too little'

		it 'has not dispensed that product' do 
			customer.buy product: "Crisps", at: vending_machine, with: {50 => 1}
			expect(vending_machine.products.count).to eq 2
		end

	context 'dispensing change' do 

		it 'renders a single coin and gives it to the customer' do 
			customer.buy product: "Crisps", at: vending_machine, with: {200 => 1, 100 => 1}
			expect(customer.wallet[50]).to eq 2
			expect(vending_machine.total_money[50]).to eq 0
		end

		it 'should be able to return two coins in the optimal format' do
			customer.wallet[20] = 4
			customer.buy product: "Crisps", at: vending_machine, with: {200 => 1, 20 => 4}
			expect(customer.wallet[20]).to eq 1
			expect(customer.wallet[10]).to eq 2
		end

		it 'should give me change of £3.88' do 
			vending_machine.products << Product.new("Cheese", 612)
			customer.wallet[200] = 6
			customer.buy product: "Cheese", at: vending_machine, with: {200 => 5}
			expect(customer.wallet.values.all? {|q| q == 2}).to be_truthy
		end

	end

	context 'messages to customer' do

		it 'tells you how much you have inserted' do 
			expect(STDOUT).to receive(:puts).with "You have inserted £2.50"
			customer.buy product: "Crisps", at: vending_machine, with: {200=>1, 50=>1}
		end

		it 'tells you if you have not inserted enough money' do 
			expect(STDOUT).to receive(:puts).with "Not enough money inserted"
			customer.buy product: "Crisps", at: vending_machine, with: {50 => 1}
		end

		it 'tells the customer his change' do 
			expect(STDOUT).to receive(:puts).with "Your change is £0.50"
			customer.buy product: "Crisps", at: vending_machine, with: {200 => 1, 100 => 1}
		end

	end

end