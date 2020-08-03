FactoryBot.define do
  factory :event do
    description { Faker::Marketing.buzzwords }
    event_date { Faker::Business.credit_card_expiry_date }
  end
end
