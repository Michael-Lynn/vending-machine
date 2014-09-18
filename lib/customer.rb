require_relative 'transactions'

class Customer

	include Transactions

	attr_accessor :total_money, :satchel

	def initialize money
		@total_money = money
		@satchel ||= []
	end

	def buy options
		product, vending_machine, money = options[:product], options[:at], options[:with]
		give money
		vending_machine.process_payment of: money, for: product, from: self
	end

	alias_method :wallet, :total_money

end