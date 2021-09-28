require 'date'

class Transaction
  attr_reader :balance, :credit, :date, :debit

  def initialize(amount, balance)
    @balance = balance
    @credit = nil
    @date = Date.today
    @debit = nil

    amount.positive? ? @credit = amount : @debit = amount.abs
  end
end
