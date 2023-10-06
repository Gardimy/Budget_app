require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'is valid with a name, amount, and category' do
    user = User.create(email: 'test@example.com', password: 'password')
    category = Category.create(name: 'Groceries', icon: 'grocery-icon', user:)
    transaction = Transaction.new(name: 'Buy Milk', amount: 10.0, category:)
    expect(transaction).to be_valid
  end

  it 'is not valid without a name' do
    transaction = Transaction.new(amount: 10.0)
    expect(transaction).to_not be_valid
  end

  it 'is not valid without an amount' do
    transaction = Transaction.new(name: 'Buy Milk')
    expect(transaction).to_not be_valid
  end
end
