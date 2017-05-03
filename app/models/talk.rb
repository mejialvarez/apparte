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

class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  has_many :messages

  enum status: [:open, :close]

  scope :filter_artwork, ->(artwork_id) { where(artwork_id: artwork_id) }

  validates :user_id, presence: true, uniqueness: { scope: [:user_id, :artwork_id] }
  validates :artwork_id, presence: true
end
