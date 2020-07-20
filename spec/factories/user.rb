FactoryBot.define do
  factory :user do
    username { Faker::Artist.name }
    email { Faker::Internet.email }
  end
end
