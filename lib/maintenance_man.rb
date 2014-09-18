require_relative 'vending_machine'

class MaintenanceMan

	attr_reader :vending_machine

	def initialize vending_machine
		@vending_machine = vending_machine
	end

	def stock_vending_machine options
		vending_machine.products += options[:with]
	end

	def refill_coin_box options
		money = options[:with] ; vending_machine.receive money
	end

end