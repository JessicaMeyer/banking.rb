
class Person

	attr_accessor :name, :cash_amount

	def initialize(name, cash_amount)
		@name = name
		@cash_amount = cash_amount #amount of cash on hand before opening up account
		puts "Hi, #{@name}. You have #{cash_amount}!"
	end
end

class Bank

	attr_accessor :bank_accounts, :bank_name
 
	def initialize(bank_name)
		@bank_name = bank_name
		@bank_accounts = {} #creates a new hash that will contain the person and their bank account amount
		puts "#{bank_name} bank was just created."
	end

	def open_account(person)
		@bank_accounts[person.name]=0 #adds the person to the bank account hash and gives their balance 0 starting off.
		puts "#{person.name}, thanks for opening an account at #{bank_name}."
	end

	def deposit(person, amount)
		
		if person.cash_amount < amount # if cash on hand is less than the amount they want to deposit then not enough funds.
			puts "You do not have enough funds to deposit the amount of $#{amount}."
		else 
			@bank_accounts[person.name] += amount #if sufficient amount of cash on hand that they are wanting to deposit, add the amount to the person's bank account.
			person.cash_amount -= amount #subtract the amount deposited from the initial cash amount
			puts "#{person.name} deposited $#{amount} to #{bank_name}. #{person.name} has $#{person.cash_amount}. #{person.name}'s account has $#{amount}."
		end
	end

	def withdraw(person, amount)
		
		if amount <= @bank_accounts[person.name] #if the amount the user is withdrawing is < amount in their account
		@bank_accounts[person.name] -= amount #then subtract that amount they want to withdraw from bank account
		person.cash_amount += amount #then add the amount to the amount of cash they have on hand
		puts "#{person.name} withdrew $#{amount} from #{bank_name}. #{person.name} has $#{person.cash_amount} cash remaining." 
		puts "#{person.name}'s account has $#{@bank_accounts[person.name]}."
	else
		puts "#{person.name}, you do not have enough funds to withdraw that $#{amount}." #if the amount they want to withdrawl is more than what they have in account, then refuse
	end
end
	
	def transfer(person, other_bank, amount) #add other_bank so person can transfer money from one bank_name to the new other_bank.
		other_bank.bank_accounts[person.name] += amount
		puts "#{person.name} transfered $#{amount} from the #{bank_name} account to the #{other_bank.bank_name} account." 
		puts "The #{bank_name} account has $#{@bank_accounts[person.name]} and the #{other_bank.bank_name} has $#{other_bank.bank_accounts[person.name]}."
	end

	def total_cash_in_bank #loop through bank accounts with each method to show how much total money is in the bank. 
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