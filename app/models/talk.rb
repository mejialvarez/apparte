class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  has_many :messages

  enum status: [:open, :close]

  validates :user_id, presence: true, uniqueness: { scope: [:user_id, :artwork_id] }
  validates :artwork_id, presence: true
end
