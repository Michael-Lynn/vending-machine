module ChangeDispenser

	def calculate_change_by remainder, change = Hash.new(0)
		total_money.each do |denomination, quantity|
			(remainder / denomination).times do 
				change[denomination] += 1
				remainder -= denomination
			end
		end
		return change
	end

	def render_change
		remainder = inserted_total - desired_product.price
		change = calculate_change_by remainder
		customer.wallet.merge!(change, &money_exchange(:+))
	end



end