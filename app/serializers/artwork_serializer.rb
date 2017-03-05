class ArtworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :score
  
  has_one :user
end
