class Account  
  attr_reader :balance

  def initialize(balance = 0, statement = Statement.new)
    @balance = balance
    @statement = statement

    show_welcome_message
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

  def statement
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

  def show_welcome_message
    puts "Welcome, new customer!"
    puts
    puts "Interact with your account using `@account`:"
    puts
    puts "Make deposits using `@account.deposit [value]`"
    puts "Make withdrawals using `@account.withdraw [value]`"
    puts "View your statement with `@account.statement.show`"
    puts
  end
end
