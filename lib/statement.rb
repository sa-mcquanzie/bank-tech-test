require 'format_helpers'

class Statement
  include FormatHelpers

  def initialize(transactions = [])
    @transactions = transactions
  end

  def add(transaction)
    @transactions << transaction
  end

  def show
    begin
      check_transactions

      print_table_row(["date", "credit", "debit", "balance"])

      @transactions.reverse.each do |transaction|
        print_table_row(formatted_transaction(transaction))
      end
    rescue StandardError => error
      puts error
    end
  end

  private

  def check_transactions
    raise "No transactions to show" if @transactions.empty?
  end
end
