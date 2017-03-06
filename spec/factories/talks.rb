FactoryGirl.define do
  factory :talk do
    association :user
    association :artwork

    status Talk.statuses[:open]

    factory :invalid_talk do
      user_id nil
      artwork_id nil
      status nil
    end
  end
end