class Api::V1::TalksController < ApplicationController

  def index
    render json: User.last.talks.order(created_at: :desc)
  end

  def show
    render json: Talk.find(params[:id])
  end

  def create
    talk = User.last.talks.new(artwork_id: params[:artwork_id])
    if talk.save
      render json: talk, status: 201
    else
      render json: { errors: talk.errors }, status: 422
    end
  end
end