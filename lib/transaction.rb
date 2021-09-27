require 'date'

class Transaction
  attr_accessor :balance, :credit, :date, :debit

  def initialize(amount, balance)
    @balance = balance
    @credit = nil
    @debit = nil
    @date = Date.today
    
    amount.positive? ? @credit = amount : @debit = amount.abs
  end
end
