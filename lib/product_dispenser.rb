module ProductDispenser

	def dispense_product
		customer.satchel << desired_product
		products.delete desired_product
	end

end