class User < ApplicationRecord
  has_many :artworks
  has_many :talks
  has_many :messages

  enum role: [:client, :artist]

  validates :full_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :phone, numericality: { only_integer: true }, if: :phone?
  validates :role, inclusion: { in: User.roles.keys }
end
