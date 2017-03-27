# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  full_name       :string(100)      not null
#  email           :string(100)      not null
#  phone           :integer
#  role            :integer          default("0"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

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
