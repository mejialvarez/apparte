require 'rails_helper'

describe Api::V1::VotesController do
  let(:client) { create(:client) }
  let(:artwork) { create(:artwork) }
  let(:vote) { create(:vote, votable: artwork, user: client) }
  let(:vote_params) { attributes_for(:vote) }
  let(:vote_invalid_params) { attributes_for(:invalid_vote) }

  before :each do
    sign_in(client)
  end

  describe 'POST #create' do
    context 'when is successfully created' do
      before :each do
        post :create,
        params: { 
          artwork_id: artwork.id,
          vote: vote_params, 
          votable_type: 'Artwork'
        }
      end

      it { should respond_with 201 }

      it 'renders the vote json created' do
        vote_response = json_response
        expect(vote_response[:score]).to eql vote_params[:score]
      end
    end

    context 'when is not created' do
      before :each do
        post :create,
        params: { 
          artwork_id: artwork.id,
          vote: vote_invalid_params,
          votable_type: 'Artwork'
        }
      end

      it { should respond_with 422 }

      it 'renders the json params errors' do
        vote_response = json_response
        expect(vote_response[:errors]).not_to eql nil
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      vote
      vote.reload
    end

    it 'decreases votes' do
      expect {
        delete :destroy,
        params: {
          artwork_id: artwork.id,
          id: vote.id,
          votable_type: 'Artwork'
        }
      }.to change(Vote,:count).by(-1)
    end
      
    it {
      delete :destroy,
      params: {
        artwork_id: artwork.id,
        id: vote.id,
        votable_type: 'Artwork'
      }
      should respond_with 204
    }
  end
end