require 'rails_helper'

describe Api::V1::ArtworksController do
  let(:artist) { create(:artist) }
  let(:artwork_params) { attributes_for(:artwork) }
  let(:artwork_invalid_params) { attributes_for(:invalid_artwork) }

  before :each do
    sign_in(artist)
  end

  describe 'GET #index' do
    before :each do
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

  describe 'POST #create' do
    context 'when is successfully created' do
      before :each do
        post :create, params: { artwork: artwork_params }
      end

      it { should respond_with 201 }

      it 'renders the product json created' do
        artwork_response = json_response
        expect(artwork_response[:name]).to eql artwork_params[:name]
      end
    end

    context 'when is not created' do
      before :each do
        post :create, params: { artwork: artwork_invalid_params }
      end

      it { should respond_with 422 }

      it 'renders the json params errors' do
        artwork_response = json_response
        expect(artwork_response[:errors]).not_to eql nil
      end
    end
  end
end