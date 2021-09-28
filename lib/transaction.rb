require 'date'

class Transaction
  attr_reader :balance, :credit, :date, :debit

  def initialize(amount, balance)
    @balance = balance
    @credit = nil
    @debit = nil
    @date = Date.today

    amount.positive? ? @credit = amount : @debit = amount.abs
  end
end
