require 'rails_helper'

describe Api::V1::TalksController, type: :controller do
  let!(:artwork) { create(:artwork) }

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        post :create, params: { artwork_id: artwork.id }
      end

      it 'renders talk json' do
        talk_response = json_response
        expect(talk_response[:artwork][:id]).to eql artwork.id
      end

      it { should respond_with 201 }
    end

    context 'with invalid params' do
      before(:each) do
        post :create, params: { artwork_id: 0 }
      end

      it 'renders the json errors' do
        talk_response = json_response
        expect(talk_response[:errors][:artwork]).to include 'must exist'
      end

      it { should respond_with 422 }
    end
  end
end