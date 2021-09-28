class Statement
  def initialize(transactions = [])
    @transactions = transactions
  end

  def add(transaction)
    @transactions << transaction
  end

  def show
    begin
      check_transactions

      print_header
      @transactions.reverse.each { |transaction| print_row(transaction) }
    rescue StandardError => error
      puts error
    end
  end

  private

  def check_transactions
    raise "No transactions to show" if @transactions.empty?
  end

  def decimal(num)
    num ? num.to_s + ".00" : ""
  end

  def euro_date(date)
    date.strftime("%d/%m/%Y")
  end

  def print_header
    header = ["date", "credit", "debit", "balance"]
    
    puts header.map { |x| x.ljust(12) }.join("||")
  end

  def print_row(transaction)
    row = [euro_date(transaction.date), decimal(transaction.credit),
      decimal(transaction.debit), decimal(transaction.balance)]

    puts row.map { |x| x.to_s.ljust(12) }.join("||")
  end
end
