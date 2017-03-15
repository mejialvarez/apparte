class Api::V1::TalksController < ApplicationController

  def index
    render json: current_user.talks.order(created_at: :desc)
  end

  def show
    render json: Talk.find(params[:id])
  end

  def create
    talk = current_user.talks.new(artwork_id: params[:artwork_id])
    if talk.save
      render json: talk, status: :created
    else
      render json: { errors: talk.errors }, status: :unprocessable_entity
    end
  end
end