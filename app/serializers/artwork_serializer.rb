class ArtworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
  
  has_one :user
  has_many :votes
end
