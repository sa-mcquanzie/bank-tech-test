require 'statement'

describe Statement do
  let (:date1) { Date.new(1982,4,1) }
  let (:date2) { Date.new(2008,4,1) }

  let (:deposit_transaction) {
    double 'Transaction', date: date1, credit: 1000, debit: nil, balance: 2500 }

  let (:withdrawal_transaction) {
    double 'Transaction', date: date2, credit: nil, debit: 500, balance: 2000 }

  let (:statement_with_deposit) { Statement.new([deposit_transaction]) }
  let (:statement_with_withdrawal) { Statement.new([withdrawal_transaction]) }
  let (:multi_transaction_statement) {
    Statement.new([deposit_transaction, withdrawal_transaction]) }

  context 'containing a single transaction' do
    it 'shows the transaction date' do
      expect { statement_with_deposit.show }.to output(/#{date1}/).to_stdout
    end

    it 'shows the transaction credit' do
      expect { statement_with_deposit.show }.to output(/1000/).to_stdout
    end

    it 'shows the transaction debit' do
      expect { statement_with_withdrawal.show }.to output(/500/).to_stdout
    end

    it 'shows the transaction balance' do
      expect { statement_with_deposit.show }.to output(/2500/).to_stdout
    end
  end

  context 'containing multiple transactions' do
    it 'shows the transaction dates' do
      expect { multi_transaction_statement.show }.to output(/#{date1}/).to_stdout
      expect { multi_transaction_statement.show }.to output(/#{date2}/).to_stdout
    end

    it 'shows the transaction credits' do
      expect { multi_transaction_statement.show }.to output(/1000/).to_stdout
    end

    it 'shows the transaction debits' do
      expect { multi_transaction_statement.show }.to output(/500/).to_stdout
    end

    it 'shows the transaction balances' do
      expect { multi_transaction_statement.show }.to output(/2500/).to_stdout
      expect { multi_transaction_statement.show }.to output(/2000/).to_stdout
    end
  end
end
