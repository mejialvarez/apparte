class Artwork < ApplicationRecord
  belongs_to :user

  enum score: [:bad, :regular, :good, :excellent]

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, numericality: { only_integer: true }
  validates :score, inclusion:  { in: Artwork.scores.keys }, if: :score?
end
