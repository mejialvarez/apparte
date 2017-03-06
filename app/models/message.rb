class Message < ApplicationRecord
  belongs_to :talk
  belongs_to :user

  validates :talk_id, presence: true
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }
end
