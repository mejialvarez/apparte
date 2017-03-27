# == Schema Information
#
# Table name: talks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  artwork_id :integer
#  status     :integer          default("0"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_talks_on_artwork_id              (artwork_id)
#  index_talks_on_user_id                 (user_id)
#  index_talks_on_user_id_and_artwork_id  (user_id,artwork_id) UNIQUE
#

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
