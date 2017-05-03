class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :role

  has_many :votes
end
