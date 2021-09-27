require './transaction'

class Account  
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = Statement.new
  end

  def deposit(amount)
    @balance += amount
    @statement.add(Transaction.new(amount, @balance))
  end

  def withdraw(amount)
    if amount > @balance
      puts "Insufficient funds"
      return
    end

    @balance -= amount
    @statement.add(Transaction.new(-amount, @balance))
  end
end
