FactoryGirl.define do
  factory :event do
    name              { Faker::Educator.course }
    description       { Faker::Lorem.sentence }
    location          { Faker::Address.street_address }
    price             { Faker::Commerce.price }
    capacity          100
    includes_food     false
    includes_drink    true
    starts_at         30.days.from_now
    ends_at           30.days.from_now + 1.hour
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
