require 'account'

describe 'when a user opens a bank account' do
  context 'without providing and money' do
    let(:new_empty_account) { Account.new }

    it 'should have a balance of 0' do
      expect(new_empty_account.balance).to be(0)
    end
  end
end
