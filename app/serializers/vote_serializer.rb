class VoteSerializer < ActiveModel::Serializer
  attributes :id, :votable_type, :votable_id, :user_id, :score, :created_at
end
