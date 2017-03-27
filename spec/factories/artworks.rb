# == Schema Information
#
# Table name: artworks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(100)      not null
#  description :string(500)      not null
#  price       :integer          not null
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_artworks_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :artwork do
    association :user, factory: :artist

    name { Faker::Name.name }
    description { Faker::Lorem.characters(500) }
    price { Faker::Number.number(9) }

    factory :invalid_artwork do
      name nil
    end
  end
end
