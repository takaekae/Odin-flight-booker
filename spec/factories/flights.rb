FactoryBot.define do
  factory :flight do
    duration { rand(3..10) }

    association :departure_airport, factory: :airport
    association :arrival_airport, factory: :airport
  end
end
