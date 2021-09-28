require_relative 'lib/account'
require_relative 'lib/statement'
require_relative 'lib/transaction'

@account = Account.new

def deposit(amount) @account.deposit(amount) end

def withdraw(amount) @account.withdraw(amount) end

def statement() @account.statement.show end
