FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    author { association :user }
  end
end
