class Api::V1::VotesController < ApplicationController

  def create
    votable_type = params[:votable_type]
    votable_id = params["#{votable_type.downcase}_id".to_s]

    votable = votable_type.constantize.find(votable_id)
    vote = votable.votes.new(vote_params)

    if current_user.voted?(votable)
      render json: { error: 'User has voted for this resource' }, status: :unauthorized
    elsif vote.save
      render json: vote, status: :created
    else
      render json: { errors: vote.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    votable_type = params[:votable_type]
    votable_id = params["#{votable_type.downcase}_id".to_s]

    vote = current_user
    .owner_votes
    .find_by_votable_type_and_votable_id(votable_type, votable_id)

    vote.try(:destroy)

    head 204
  end

  private

    def vote_params
      params.require(:vote).permit(:score).merge(user: current_user)
    end
end
