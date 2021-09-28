require_relative 'transaction'

class Account  
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = Statement.new
  end

  def deposit(amount = 0)
    begin
      check_input(amount)

      @balance += amount
      @statement.add(Transaction.new(amount, @balance))
    rescue StandardError => error
      puts error
    end
  end

  def withdraw(amount = 0)
    begin
      check_input(amount)
      check_sufficient_funds(amount)

      @balance -= amount
      @statement.add(Transaction.new(-amount, @balance))
    rescue StandardError => error
      puts error
    end
  end

  private

  def check_input(amount)
    raise 'Amount must be a whole number' unless amount.class == Integer
    raise 'Amount must be non-zero' if amount.zero?
    raise 'Amount must be positive' if amount.negative?
  end

  def check_sufficient_funds(amount)
    raise 'Insufficient funds' if amount > @balance
  end
end
