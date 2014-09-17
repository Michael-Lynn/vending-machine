require_relative 'customer'
require_relative 'product'
require_relative 'change_dispenser'

class VendingMachine

	include ChangeDispenser

	attr_accessor :products, :total_money, :customer, :inserted_money, :purchase_name, :desired_product

	def initialize products, total_money
		@products = products
		@total_money = total_money
	end

	def product_by product_name
		Proc.new {|product| product.name == product_name  }
	end

	def process_payment payment
		@desired_product, @inserted_money, @customer = products.find(&product_by(payment[:for])), payment[:of], payment[:from]
		take_money
		dispense_product if order_ok?
	end

	def dispense_product
		customer.satchel << desired_product
		products.delete desired_product
	end

	def take_money
		customer.wallet -= desired_product.price
		@total_money += inserted_money
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
		desired_product.price > inserted_money
	end


end