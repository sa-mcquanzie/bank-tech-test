require 'bank'

describe 'Bank' do
  account = Account.new
  it 'lets a user make a deposit' do
    allow(Date).to receive(:today).and_return Date.new(2023,01,10)
    account.deposit 1000
    expect { account.statement.show }.to output(/1000.00/).to_stdout
  end

  it 'lets a user make another deposit' do
    allow(Date).to receive(:today).and_return Date.new(2023,01,13)
    account.deposit 2000
    expect { account.statement.show }.to output(/3000.00/).to_stdout
  end

  it 'lets a user make a withdrawal' do
    allow(Date).to receive(:today).and_return Date.new(2023,01,14)
    account.withdraw 500
    expect { account.statement.show }.to output(/2500.00/).to_stdout
  end

  it 'lets a user see their statement' do
    l1 = ("date        ||credit      ||debit       ||balance     ")
    l2 = ("14/01/2023  ||            ||500.00      ||2500.00     ")
    l3 = ("13/01/2023  ||2000.00     ||            ||3000.00     ")
    l4 = ("10/01/2023  ||1000.00     ||            ||1000.00     ")

    expect { account.statement.show }
    .to output([l1, l2, l3, l4].join("\n") + "\n").to_stdout
  end
end
