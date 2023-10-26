require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid when password and password confirmation do not match' do
    user = User.new(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'mismatch',
      full_name: 'John Doe'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid when password confirmation is nil' do
    user = User.new(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: nil,
      full_name: 'John Doe'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    User.create(
      email: 'test@example.com',
      password: 'password123',
      full_name: 'John Doe'
    )
    user = User.new(
      email: 'test@example.com',
      password: 'anotherpassword',
      full_name: 'Jane Smith'
    )
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a short password' do
    user = User.new(password: 'short')
    expect(user).to_not be_valid
  end

  it 'is not valid without a full name' do
    user = User.new(full_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a short full name' do
    user = User.new(full_name: 'A')
    expect(user).to_not be_valid
  end

  it 'has many categories' do
    association = User.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many payments' do
    association = User.reflect_on_association(:payments)
    expect(association.macro).to eq(:has_many)
  end

  it 'should be confirmable' do
    is_confirmable = User.devise_modules.include?(:confirmable)
    expect(is_confirmable).to be true
  end
end
