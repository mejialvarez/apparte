class User < ApplicationRecord
  has_many :artworks

  enum role: [:client, :artist]

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone, numericality: { only_integer: true }, if: :phone?
  validates :role, inclusion:  { in: User.roles.keys }
end
