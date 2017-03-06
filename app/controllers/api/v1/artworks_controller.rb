class Api::V1::ArtworksController < ApplicationController
  def index
    render json: Artwork.all.order(created_at: :desc)
  end
end