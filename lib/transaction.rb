require 'date'

class Transaction
  attr_accessor :balance, :credit, :date, :debit

  def initialize(amount, balance)
    @balance = balance
    @credit, @debit = nil, nil
    @date = Date.today
    amount.positive? ? @credit = amount : @debit = amount.abs
  end
end
