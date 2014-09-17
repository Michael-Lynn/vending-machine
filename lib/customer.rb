class Customer

	def satchel
		@satchel ||= []
	end

	def buy(options)
		product, vending_machine, money = options[:product], options[:at], options[:with]
		vending_machine.process_payment of: money, for: product
	end


end