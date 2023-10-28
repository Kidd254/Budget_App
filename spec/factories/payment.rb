FactoryBot.define do
  factory :payment do
    amount { 100 }
    description { 'Example payment' }
    date { Date.today }
    association :category # This is how you associate the payment with a category
    author { association :user }
  end
end
