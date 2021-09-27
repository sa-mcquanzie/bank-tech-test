require 'account'

describe Account do
  context 'opened with no initial balance' do
    let(:new_empty_account) { Account.new }

    it 'should have a balance of 0' do
      expect(new_empty_account.balance).to be(0)
    end
  end

  context 'opened with an initial balance' do
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
  end

  context 'when a user makes a withdrawal' do
    it 'subtracts the deposited amount from the balance' do
      subject.deposit(1000)
      subject.withdraw(750)

      expect(subject.balance).to be(250)
    end
  end
end
