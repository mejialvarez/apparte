require 'rails_helper'

describe Api::V1::ArtworksController do
  let(:artist) { create(:artist) }

  describe 'GET #index' do
    before(:each) do
      4.times { create(:artwork, user_id: artist.id) }
      get :index
    end

    it "responds with status 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it 'populates an array of artworks' do
      artworks_response = json_response
      expect(artworks_response.size).to eq(4)
    end
  end
end