
class Person

	attr_accessor :name, :cash_amount

	def initialize(name, cash_amount)
		@name = name
		@cash_amount = cash_amount 
		puts "Hi, #{@name}. You have #{cash_amount}!"
	end
end

class Bank

	attr_accessor :bank_accounts, :bank_name
 
	def initialize(bank_name)
		@bank_name = bank_name
		@bank_accounts = {} 
		puts "#{bank_name} bank was just created."
	end

	def open_account(person)
		@bank_accounts[person.name]=0 
		puts "#{person.name}, thanks for opening an account at #{bank_name}."
	end

	def deposit(person, amount)
		
		if person.cash_amount < amount 
			puts "You do not have enough funds to deposit the amount of $#{amount}."
		else 
			@bank_accounts[person.name] += amount 
			person.cash_amount -= amount 
			puts "#{person.name} deposited $#{amount} to #{bank_name}. #{person.name} has $#{person.cash_amount}. #{person.name}'s account has $#{amount}."
		end
	end

	def withdraw(person, amount)
		
		if amount <= @bank_accounts[person.name] 
		@bank_accounts[person.name] -= amount 
		person.cash_amount += amount 
		puts "#{person.name} withdrew $#{amount} from #{bank_name}. #{person.name} has $#{person.cash_amount} cash remaining." 
		puts "#{person.name}'s account has $#{@bank_accounts[person.name]}."
	else
		puts "#{person.name}, you do not have enough funds to withdraw that $#{amount}." 
	end
end
	
	def transfer(person, other_bank, amount) 
		other_bank.bank_accounts[person.name] += amount
		puts "#{person.name} transfered $#{amount} from the #{bank_name} account to the #{other_bank.bank_name} account." 
		puts "The #{bank_name} account has $#{@bank_accounts[person.name]} and the #{other_bank.bank_name} has $#{other_bank.bank_accounts[person.name]}."
	end

	def total_cash_in_bank  
		total = 0
		@bank_accounts.each do |person, amount|
		 total += amount
		 puts "#{bank_name} has $#{total} in the bank."
		end
	end

	# def total_in_acct(person)
	# 	@bank_accounts.each do |person, amount|
	# 		puts "#{person} has a balance of $#{@bank_accounts[person]} in their bank account."
	# 	end
	# end

	

end #end of Bank class

# --- creating accounts ---- #

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
jess = Person.new("Jessica", 500)
chris = Person.new("Chris", 1000)
chase.open_account(jess)
wells_fargo.open_account(jess)
chase.open_account(chris)
wells_fargo.open_account(chris)
chase.transfer(chris, wells_fargo, 100)

# ---- withdrawing and depositing ---- # 

chase.deposit(jess, 200)
wells_fargo.deposit(chris, 300)
chase.withdraw(jess, 50)

# --- extra credit level 1: validate ---- #

chase.deposit(jess, 5000)
chase.withdraw(jess, 5000)

# ---- extra credit level 2: count totals ---- #
chase.total_cash_in_bank
wells_fargo.total_cash_in_bank

# chase.total_in_acct(jess)
# wells_fargo.total_in_acct(chris)