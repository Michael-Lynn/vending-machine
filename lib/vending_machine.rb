require_relative 'customer'
require_relative 'product'
require_relative 'change_dispenser'
require_relative 'coin_slot'
require_relative 'the_claw'
require_relative 'calculator'

class VendingMachine

	include ChangeDispenser, CoinSlot, TheClaw, Calculator

	attr_accessor :products, :total_money, :customer, :inserted_money, :purchase_name, :desired_product

	def initialize products, total_money
		@products = products
		@total_money = total_money
	end

	def process_payment payment
		@desired_product = products.find {|product| product.name == payment[:for]}
		@inserted_money, @customer = payment[:of], payment[:from]
		take_money
		dispense_product and render_change if order_ok?
	end

end