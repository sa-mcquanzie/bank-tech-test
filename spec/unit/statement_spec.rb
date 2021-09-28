require 'statement'

describe Statement do
  let (:date1) { Date.new(1982,4,1) }
  let (:date2) { Date.new(2008,4,1) }

  let (:deposit_transaction) {
    double 'Transaction', date: date1, credit: 1000, debit: nil, balance: 2500
  }

  let (:withdrawal_transaction) {
    double 'Transaction', date: date2, credit: nil, debit: 500, balance: 2000
  }

  let (:statement_with_deposit) { Statement.new([deposit_transaction]) }

  let (:statement_with_withdrawal) { Statement.new([withdrawal_transaction])
  }

  let (:statement_with_both) {
    Statement.new([deposit_transaction, withdrawal_transaction])
  }

  context 'containing no transactions' do
    it 'informs the user no transactions have been made' do
      expect { subject.show }.to output("No transactions to show\n").to_stdout
    end
  end

  context 'containing a single transaction' do
    it 'shows the transaction date' do
      expect { statement_with_deposit.show }.to output(/01\/04\/1982/).to_stdout
    end

    it 'shows the transaction credit' do
      expect { statement_with_deposit.show }.to output(/1000.00/).to_stdout
    end

    it 'shows the transaction debit' do
      expect { statement_with_withdrawal.show }.to output(/500.00/).to_stdout
    end

    it 'shows the transaction balance' do
      expect { statement_with_deposit.show }.to output(/2500.00/).to_stdout
    end
  end

  context 'containing multiple transactions' do
    it 'shows the transaction dates' do
      expect { statement_with_both.show }.to output(/01\/04\/1982/).to_stdout

      expect { statement_with_both.show }.to output(/01\/04\/2008/).to_stdout
    end

    it 'shows the transaction credits' do
      expect { statement_with_both.show }.to output(/1000.00/).to_stdout
    end

    it 'shows the transaction debits' do
      expect { statement_with_both.show }.to output(/500.00/).to_stdout
    end

    it 'shows the transaction balances' do
      expect { statement_with_both.show }.to output(/2500.00/).to_stdout
      expect { statement_with_both.show }.to output(/2000.00/).to_stdout
    end

    it 'shows the transactions in reverse chronological order' do
      expect { statement_with_both.show }
      .to output(/2000.00     \n01\/04\/1982/).to_stdout
    end
  end
end
