require 'account'

describe Account do
  context 'when opened with no initial balance' do
    let(:new_empty_account) { Account.new }

    it 'should have a balance of 0' do
      expect(new_empty_account.balance).to be(0)
    end
  end

  context 'when opened with some initial balance' do
    let(:new_account_with_money) { Account.new(100) }

    it 'should contain the initial balance' do
      expect(new_account_with_money.balance).to be(100)
    end
  end

  context 'when a user makes a deposit' do
    it 'adds the deposited amount to the balance' do
      subject.deposit(100)

      expect(subject.balance).to be(100)
    end

    it 'reminds them to supply an amount if they forget' do
      expect { subject.deposit }
      .to output("Amount must be non-zero\n").to_stdout
    end

    it 'reminds them to enter a positive amount if the amount is negative' do
      expect { subject.deposit(-50) }
      .to output("Amount must be positive\n").to_stdout
    end
  end

  context 'when a user makes a withdrawal' do
    it 'subtracts the deposited amount from the balance' do
      subject.deposit(1000)
      subject.withdraw(750)

      expect(subject.balance).to be(250)
    end

    it 'reminds them to supply an amount if they forget' do
      expect { subject.deposit }
      .to output("Amount must be non-zero\n").to_stdout
    end

    it 'reminds them to enter a positive amount if the amount is negative' do
      expect { subject.withdraw(-50) }
      .to output("Amount must be positive\n").to_stdout
    end

    it 'does not allow negative balances' do
      subject.deposit(1000)

      expect { subject.withdraw(1001) }.to output("Insufficient funds\n").to_stdout
    end
  end
end
