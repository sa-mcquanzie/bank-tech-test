require 'account'
require 'transaction'
require 'statement'

describe Account do
  let(:date1) { Date.new(1982,4,1) }
  let(:date2) { Date.new(2008,4,1) }
  let(:statement) { double(Statement, transactions: []) }
  let(:subject) { Account.new(0, statement) }
  let(:transaction) { double Transaction }
  let(:transactions) { [] }

  before do
    allow(Transaction).to receive(:new).with(any_args).and_return(transaction)
    allow(Statement).to receive(:new).with(any_args).and_return(statement)
    allow(statement).to receive(:add).with(any_args) do |value| 
      statement.transactions << value
    end
  end

  describe '#show_statement' do
    it 'tells you when there are no transactions' do

    end
  end

  context 'when opened with no initial balance' do
    it 'shows it has a balance of 0' do
      expect { subject }.to output(/Balance is zero/).to_stdout
    end
  end

  context 'when opened with some initial balance' do
    let(:subject) { Account.new(50, statement) }

    it 'shows the initial balance' do
      expect { subject }.to output(/Deposited 50/).to_stdout
    end

    it 'adds a transaction to the statement' do
      account = Account.new(50, statement)

      expect(statement.transactions).not_to be_empty
    end
  end

  context 'when a user makes a deposit' do
    it 'adds the deposited amount to the balance' do
      expect { subject.deposit(100) }
      .to output(/Deposited 100/).to_stdout
    end

    it 'reminds them to supply an amount if they forget' do
      expect { subject.deposit }
      .to output(/Amount must be non-zero\n/).to_stdout
    end

    it 'reminds them to enter a positive amount if the amount is negative' do
      expect { subject.deposit(-50) }
      .to output(/Amount must be positive\n/).to_stdout
    end
  end

  context 'when a user makes a withdrawal' do
    it 'subtracts the deposited amount from the balance' do
      subject.deposit(1000)

      expect { subject.withdraw(750) }
      .to output(/Withdrew 750/).to_stdout
    end

    it 'reminds them to supply an amount if they forget' do
      expect { subject.deposit }
      .to output(/Amount must be non-zero\n/).to_stdout
    end

    it 'reminds them to enter a positive amount if the amount is negative' do
      expect { subject.withdraw(-50) }
      .to output(/Amount must be positive\n/).to_stdout
    end

    it 'does not allow negative balances' do
      subject.deposit(1000)

      expect { subject.withdraw(1001) }.to output(/Insufficient funds/).to_stdout
    end
  end
end
