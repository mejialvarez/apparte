FactoryGirl.define do
  factory :artwork do
    association :user

    name { Faker::Name.name }
    description { Faker::Lorem.characters(500) }
    price { Faker::Number.number(9) }

    factory :invalid_artwork do
      name nil
      description nil
      price nil
      score nil
    end
  end
end