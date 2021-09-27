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
    header = ["date", "credit", "debit", "balance"]
    
    puts header.map { |x| x.ljust(12) }.join("||")
  end

  def print_row(transaction)
    row = [ euro_date(transaction.date), transaction.credit,
      transaction.debit, transaction.balance ]

    puts row.map { |x| x.to_s.ljust(12) }.join("||")
  end

  def euro_date(date)
    date.strftime("%d/%m/%Y")
  end
end
