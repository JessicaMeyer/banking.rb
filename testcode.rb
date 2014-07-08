
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