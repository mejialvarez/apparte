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

class Artwork < ApplicationRecord
  belongs_to :user

  enum score: [:bad, :regular, :good, :excellent]

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, numericality: { only_integer: true }
  validates :score, inclusion:  { in: Artwork.scores.keys }, if: :score?
end
