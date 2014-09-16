require_relative 'product'

class VendingMachine

	attr_accessor :products

	def initialize(products)
		@products = products
	end

end