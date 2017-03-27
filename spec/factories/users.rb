FactoryGirl.define do
  factory :user do

    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::Number.number(9) }
    password 'password'

    factory :client do
      role User.roles[:client]
    end

    factory :artist do
      role User.roles[:artist]
    end

    factory :invalid_user do
      full_name nil
      email nil
      phone nil
      role nil
    end
  end
end