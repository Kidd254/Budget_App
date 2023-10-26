require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = Category.new(
      name: 'Sample Category',
      description: 'Sample description',
      icon: 'sample_icon.png',
      author_id: 1
    )

    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: nil)
    expect(category).to_not be_valid
  end

  it 'is not valid without an author' do
    category = Category.new(
      name: 'Sample Category',
      description: 'Sample description',
      icon: 'sample_icon.png'
    )
    expect(category).to_not be_valid
  end

  it 'has many payments' do
    association = Category.reflect_on_association(:payments)
    expect(association.macro).to eq(:has_many)
  end

  it 'validates uniqueness of name and icon within the user' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      full_name: 'John Doe'
    )

    Category.create(
      name: 'Sample Category',
      description: 'Sample description',
      icon: 'sample_icon.png',
      author_id: user.id
    )

    category = Category.new(
      name: 'Sample Category',
      description: 'Another description',
      icon: 'sample_icon.png',
      author_id: user.id
    )

    expect(category).to_not be_valid
  end
end
