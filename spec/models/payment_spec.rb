require 'rails_helper'

RSpec.describe Payment, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      full_name: 'John Doe'
    )

    Payment.create(
      name: 'Sample Payment',
      amount: 100.00,
      author_id: user.id,
      category: Category.create(
        name: 'Sample Category',
        description: 'Sample description',
        icon: 'sample_icon.png',
        author_id: user.id
      )
    )

    expect(payment).to be_valid
  end

  it 'is not valid without a name' do
    payment = Payment.new(name: nil)
    expect(payment).to_not be_valid
  end

  it 'is not valid without an amount' do
    payment = Payment.new(amount: nil)
    expect(payment).to_not be_valid
  end

  it 'is not valid with a non-numeric amount' do
    payment = Payment.new(amount: 'not_a_number')
    expect(payment).to_not be_valid
  end

  it 'is not valid with an amount less than or equal to 0' do
    payment = Payment.new(amount: 0)
    expect(payment).to_not be_valid
  end

  it 'is not valid without an author' do
    payment = Payment.new(
      name: 'Sample Payment',
      amount: 100.00,
      category: Category.new
    )
    expect(payment).to_not be_valid
  end

  it 'is not valid without a category' do
    payment = Payment.new(
      name: 'Sample Payment',
      amount: 100.00,
      author: User.new
    )
    expect(payment).to_not be_valid
  end

  it 'belongs to an author (User)' do
    association = Payment.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a category' do
    association = Payment.reflect_on_association(:category)
    expect(association.macro).to eq(:belongs_to)
  end
end
