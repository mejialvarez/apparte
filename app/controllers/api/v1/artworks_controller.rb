class Api::V1::ArtworksController < ApplicationController
  def index
    render json: Artwork.all.order(created_at: :desc)
  end

  def create
    artwork = current_user.artworks.new(artwork_params)
    if artwork.save
      render json: artwork, status: :created
    else
      render json: { errors: artwork.errors }, status: :unprocessable_entity
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(:name, :description, :price)
    end
end