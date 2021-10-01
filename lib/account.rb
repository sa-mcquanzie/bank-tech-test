require_relative 'display_helpers'

class Account
  include DisplayHelpers

  def initialize(balance = 0, statement = Statement.new)
    @balance = balance
    @statement = statement

    show_welcome_message
    deposit(balance) if balance.positive?
  end

  def deposit(amount = 0)
    begin
      check_input(amount)

      @balance += amount
      @statement.add(Transaction.new(amount, @balance))

      puts "Deposited #{amount}"
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

      puts "Withdrew #{amount}"
    rescue StandardError => error
      puts error
    end
  end

  def show_statement
    @statement.show
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

  def new_transaction(num)
    transaction = Transaction.new

    transaction.amount = num
    transaction.balance = @balance
    num.positive? ? transaction.credit = num : transaction.debit = num.abs
  end
end
