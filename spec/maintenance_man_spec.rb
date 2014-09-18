require 'maintenance_man'

describe MaintenanceMan do 

	let(:pete) {MaintenanceMan.new vending_machine}

	it 'should be assigned to a vending machine' do 
		expect(pete.vending_machine).to eq vending_machine
	end

	it 'should be able to stock a vending machine with a product' do 
		pete.stock_vending_machine with: [coke]
		expect(vending_machine.products).to include coke
	end

	it 'should be able to stock a vending_machine with multiple products' do 
		pete.stock_vending_machine with: [coke, water]
		expect(vending_machine.products).to include coke, water
	end

	it 'should be able to refill a vending_machine coin box' do
		pete.refill_coin_box with: {1 => 1, 2 => 1}
		expect(vending_machine.total_money[1]).to eq 2
		expect(vending_machine.total_money[2]).to eq 2
	end

end