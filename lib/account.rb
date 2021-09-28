require_relative 'transaction'

class Account  
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = Statement.new
  end

  def deposit(amount = 0)
    begin
      check_non_zero(amount)

      @balance += amount
      @statement.add(Transaction.new(amount, @balance))
    rescue StandardError => error
      puts error
    end
  end

  def withdraw(amount = 0)
    begin
      check_non_zero(amount)
      check_sufficient_funds(amount)

      @balance -= amount
      @statement.add(Transaction.new(-amount, @balance))
    rescue StandardError => error
      puts error
    end
  end

  private

  def check_non_zero(amount)
    raise 'A transaction requires a non-zero amount' if amount.zero?
  end

  def check_sufficient_funds(amount)
    raise 'Insufficient funds' if amount > @balance
  end
end
