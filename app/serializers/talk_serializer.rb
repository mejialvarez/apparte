class TalkSerializer < ActiveModel::Serializer
  attributes :id, :status

  has_one :user
  has_one :artwork
  has_many :messages
end
