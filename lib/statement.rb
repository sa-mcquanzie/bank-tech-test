class Statement
  def initialize(transactions = [])
    @transactions = transactions
  end

  def show
    print_header
    print "No transactions" if @transactions.empty?
    @transactions.each { |transaction| print_row(transaction) }
    puts
  end

  private

  def print_header
    labels = ["date", "credit", "debit", "balance"].map { |x| x.center(20) }
    .join("||")
    
    puts labels
  end

  def print_row(transaction)
    row = [transaction.date, transaction.credit,
      transaction.debit, transaction.balance].map { |x| x.to_s.center(20) }
      .join("||")

    puts row
  end
end
