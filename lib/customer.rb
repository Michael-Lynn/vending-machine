class Customer

	attr_accessor :wallet

	def initialize money
		@wallet = money
	end


	def satchel
		@satchel ||= []
	end

	def buy(options)
		product, vending_machine, money = options[:product], options[:at], options[:with]
		vending_machine.process_payment of: money, for: product, from: self
	end


end