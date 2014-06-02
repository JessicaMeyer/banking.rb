class Person

	attr_accessor :name

	def initialize(name, money_amount)
		@name = name
		@money_amount = money_amount
		Kernel.puts "My name is #{@name}, and I have #{@money_amount} in my bank account."
	end
end

class Bank

	attr_accessor :bank_name
	attr_reader :balance 

	def open_account(bank_name)
		@bank_name = bank_name
		Kernel.puts "#{@bank_name} account has been created."
	end

	def deposit (money, bank_name)
		@money = money
		@bank_name = bank_name
		Kernel.puts "Depositing #{@money} into my #{@bank_name} account."
	end

	def withdraw (amount, bank_name)
		@balance = 500
		if @balance <= amount
			Kernel.puts "You have overdrawn your bank account! Please transfer money from #{@bank_name}."
		else 
			Kernel.puts "Your balance looks fine for now, but keep an eye on it!"
		end
	end
	
	def transfer (name, transfer_amount, bank_name)
		@name = name
		@transfer_amount = transfer_amount
		@bank_name = bank_name
		Kernel.puts "#{@name} is transferring #{@transfer_amount} to your #{@bank_name} checking account."
	end
end


me = Person.new("Jessica", 500)
#IRB for code above:
# 2.1.0 :007 > load 'banking.rb'
# My name is Jessica, and I have 500 in my bank account.
# My name is John, and I have 1000 in my bank account.
#  => true 

bank1 = Bank.new
# bank2 = Bank.new
bank1.open_account("Wells Fargo")
# bank2.open_account("Chase Bank")
#IRB for code above:
# #2.1.0 :028 > load 'banking.rb'
# Wells Fargo account has been created.
# Chase Bank account has been created.
#  => true 

bank1.deposit(500,"Wells Fargo")
# bank2.deposit(1000, "Chase Bank")
#IRB for code above:
# 2.1.0 :038 > load 'banking.rb'
# Depositing 500 into my Wells Fargo account.
# Depositing 1000 into my Chase Bank account.
#  => true 

bank1.withdraw(600,"Wells Fargo")
bank1.withdraw(100, "Wells Fargo")
#IRB for code above:
# 2.1.0 :059 > load 'banking.rb'
# You have overdrawn your bank account! Please transfer money from Wells Fargo.
# Your balance looks fine for now, but keep an eye on it!
#  => true 

bank1.transfer("Chris", 1000, "Wells Fargo")
#IRB for code above
# 2.1.0 :064 > load 'banking.rb'
# Chris is transferring 1000 to your Wells Fargo checking account.
#  => true 

#All IRB output code for exercise:
# 2.1.0 :064 > load 'banking.rb'
# My name is Jessica, and I have 500 in my bank account.
# Wells Fargo account has been created.
# Depositing 500 into my Wells Fargo account.
# You have overdrawn your bank account! Please transfer money from Wells Fargo.
# Your balance looks fine for now, but keep an eye on it!
# Chris is transferring 1000 to your Wells Fargo checking account.
#  => true 