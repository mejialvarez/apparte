# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  talk_id    :integer
#  user_id    :integer
#  body       :string(140)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_talk_id  (talk_id)
#  index_messages_on_user_id  (user_id)
#

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
