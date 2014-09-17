require_relative 'customer'
require_relative 'product'
require_relative 'change_dispenser'
require_relative 'coin_slot'
require_relative 'the_claw'

class VendingMachine

	include ChangeDispenser, CoinSlot, TheClaw

	attr_accessor :products, :total_money, :customer, :inserted_money, :purchase_name, :desired_product

	def initialize products, total_money
		@products = products
		@total_money = total_money
	end

	def process_payment payment
		@desired_product, @inserted_money, @customer = products.find(&product_by(payment[:for])), payment[:of], payment[:from]
		take_money
		dispense_product if order_ok?
		render_change
	end


end