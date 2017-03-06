class Api::V1::TalksController < ApplicationController
  def create
    talk = User.first.talks.new(artwork_id: params[:artwork_id])
    if talk.save
      render json: talk, status: 201
    else
      render json: { errors: talk.errors }, status: 422
    end
  end
end