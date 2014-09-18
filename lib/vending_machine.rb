require_relative 'customer'
require_relative 'product'
require_relative 'change_dispenser'
require_relative 'coin_slot'
require_relative 'product_dispenser'
require_relative 'calculator'
require_relative 'transactions'
require_relative 'maintenance_man'

class VendingMachine

	include ChangeDispenser, CoinSlot, ProductDispenser, Calculator, Transactions

	attr_accessor :products, :total_money, :customer, :inserted_money, :purchase_name, :desired_product

	def initialize products, total_money
		@products = products
		@total_money = total_money
	end

	def process_payment payment
		@desired_product, @inserted_money, @customer = products.find {|product| product.name == payment[:for]}, payment[:of], payment[:from]
		take_money
		dispense_product and render_change if order_ok?
	end

end