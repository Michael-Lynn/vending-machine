module CoinSlot

	def take_money
		puts "You have inserted #{convert_to_sterling inserted_money}"
		receive inserted_money
	end

	def order_ok?
		incorrect_amount_given? ? (puts "Not enough money inserted") : true
	end

end