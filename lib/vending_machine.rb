require_relative 'customer'
require_relative 'product'
require_relative 'change_dispenser'

class VendingMachine

	include ChangeDispenser

	attr_accessor :products, :total_money

	def initialize products, total_money
		@products = products
		@total_money = total_money
	end

	def product_by product_name
		Proc.new {|product| product.name == product_name  }
	end

	def process_payment payment
		@product_name, @inserted_money, @customer = payment[:for], payment[:of], payment[:from]
		dispense_product if order_ok?
	end

	def dispense_product
		product = products.find(&product_by(@product_name))
		@customer.satchel << product
		products.delete product
		@total_money += @inserted_money
	end

	def order_ok?
		if incorrect_amount_given?
			puts "Not enough money inserted"
			false
		else
			true
		end
	end

	def incorrect_amount_given?
		products.find(&product_by(@product_name)).price > @inserted_money
	end


end