require 'transaction'

describe Transaction do
  let (:deposit) { Transaction.new(50, 100) }
  let (:withdrawal) { Transaction.new(-50, 200) }

  it 'should record the date it was made' do
    expect(deposit.date).to eq(Date.today)
  end

  it 'should record the balance at the time it was made' do
    expect(withdrawal.balance).to be(200)
  end

  context 'when created with a positive amount' do
    it 'should record a credit' do
      expect(deposit.credit).to be(50)
    end

    it 'should not record a debit' do
      expect(deposit.debit).to be(nil)
    end
  end

  context 'when created with a negative amount' do
    it 'should record a debit' do
      expect(withdrawal.debit).to be(50)
    end

    it 'should not record a credit' do
      expect(withdrawal.credit).to be(nil)
    end
  end
end
