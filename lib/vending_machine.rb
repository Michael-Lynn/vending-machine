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
		product_name, inserted_money = payment[:for], payment[:of]
		dispense_product product_name, inserted_money if order_ok? product_name, inserted_money
	end

	def dispense_product product_name, inserted_money
		products.delete_if(&product_by(product_name)) 
		@total_money += inserted_money
	end

	def order_ok? product_name, inserted_money
		if incorrect_amount_given_with? inserted_money, product_name 
			puts "Not enough money inserted"
			return false
		else
			true
		end
	end

	def incorrect_amount_given_with? inserted_money, product_name
		products.find(&product_by(product_name)).price > inserted_money
	end


end