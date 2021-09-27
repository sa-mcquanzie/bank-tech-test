class Statement
  def initialize(transactions = [])
    @transactions = transactions
  end

  def add(transaction)
    @transactions << transaction
  end

  def show
    print_header

    print "No transactions" if @transactions.empty?

    @transactions.each { |transaction| print_row(transaction) }

    puts
  end

  private

  def print_header
    labels = ["date", "credit", "debit", "balance"].map { |x| x.ljust(12) }
    .join("||")
    
    puts labels
  end

  def print_row(transaction)
    row = [euro_date(transaction.date), transaction.credit,
      transaction.debit, transaction.balance].map { |x| x.to_s.ljust(12) }
      .join("||")

    puts row
  end

  def euro_date(date)
    date.strftime("%d/%m/%Y")
  end
end
