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

class Message < ApplicationRecord
  belongs_to :talk
  belongs_to :user

  validates :talk_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }
end
