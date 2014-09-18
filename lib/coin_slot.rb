module CoinSlot

	def money_exchange transaction_type
		Proc.new {|denomination, wallet_frequency, inserted_frequency| wallet_frequency.send transaction_type, inserted_frequency }
	end

	def take_money
		puts "You have inserted #{format("£%.2f", total_of(inserted_money).to_f/100)}"
		customer.wallet = customer.wallet.merge(inserted_money, &money_exchange(:-)) 
		@total_money = @total_money.merge(inserted_money, &money_exchange(:+))
	end

	def order_ok?
		incorrect_amount_given? ? (puts "Not enough money inserted") : true
	end

	def total_of amount
		amount.map {|denomination, quantity| denomination * quantity}.inject(:+)
	end

	def incorrect_amount_given?
		desired_product.price > (total_of inserted_money)
	end

end