require_relative 'transactions'

class Customer

	include Transactions

	attr_accessor :wallet, :satchel

	def initialize money
		@wallet = money
		@satchel ||= []
	end

	def buy options
		product, vending_machine, money = options[:product], options[:at], options[:with]
		give amount: money, to: vending_machine
		vending_machine.process_payment of: money, for: product, from: self
	end

	def give options
		recipient, amount = options[:to], options[:amount]
		@wallet = @wallet.merge(amount, &money_exchange(:-))
	end

	alias_method :total_money, :wallet

end