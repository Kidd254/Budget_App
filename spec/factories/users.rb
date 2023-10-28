require 'faker'
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    full_name { 'John Doe' }
  end
end
