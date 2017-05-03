class Api::V1::TalksController < ApplicationController

  def index
    if params[:artwork_id].present?
      talks = current_user
      .talks
      .filter_artwork(params[:artwork_id])
      .order(created_at: :desc)
      
      render json: talks
    else
      render json: current_user.talks.order(created_at: :desc)
    end
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