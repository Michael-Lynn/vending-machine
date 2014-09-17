module TheClaw

	def product_by product_name
		Proc.new {|product| product.name == product_name  }
	end

	def dispense_product
		customer.satchel << desired_product
		products.delete desired_product
	end

end