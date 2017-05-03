# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_type :string
#  votable_id   :integer
#  user_id      :integer
#  score        :integer          default("0"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_votes_on_user_id                      (user_id)
#  index_votes_on_votable_type_and_votable_id  (votable_type,votable_id)
#

FactoryGirl.define do
  factory :vote do
    score "excellent"

    factory :invalid_vote do
      score nil
    end
  end
end
