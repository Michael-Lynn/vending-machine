module CoinSlot

	def money_exchange transaction_type
		Proc.new {|denomination, wallet_frequency, inserted_frequency| wallet_frequency.send transaction_type, inserted_frequency }
	end

	def take_money
		puts "You have inserted #{convert_to_sterling inserted_money}"
		customer.wallet = customer.wallet.merge(inserted_money, &money_exchange(:-)) 
		@total_money.merge!(inserted_money, &money_exchange(:+))
	end

	def order_ok?
		incorrect_amount_given? ? (puts "Not enough money inserted") : true
	end

end