module Transactions

	def money_exchange transaction_type
		Proc.new {|denomination, wallet_frequency, inserted_frequency| wallet_frequency.send transaction_type, inserted_frequency }
	end

	def receive money
		total_money.merge! money, &money_exchange(:+) 
	end

	def give money
		@total_money = @total_money.merge(money, &money_exchange(:-))
	end

end