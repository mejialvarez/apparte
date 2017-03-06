FactoryGirl.define do
  factory :message do
    association :talk
    association :user

    body { Faker::Lorem.characters(140) }

    factory :invalid_message do
      talk_id nil
      user_id nil
      body nil
    end
  end
end