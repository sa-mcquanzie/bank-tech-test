require_relative 'account'
require_relative 'statement'
require_relative 'transaction'

@account = Account.new

def deposit(amount) @account.deposit(amount) end

def withdraw(amount) @account.withdraw(amount) end
    
def statement() @account.statement.show end
