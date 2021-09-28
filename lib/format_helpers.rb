module FormatHelpers
  def decimal(num)
    num ? num.to_s + ".00" : ""
  end

  def euro_date(date)
    date.strftime("%d/%m/%Y")
  end

  def print_table_row(array)
    puts array.map { |x| x.to_s.ljust(12) }.join("||")
  end

  def formatted_transaction(transaction)
    [
      euro_date(transaction.date), decimal(transaction.credit),
      decimal(transaction.debit), decimal(transaction.balance)
    ]
  end
end
