require 'rails_helper'

describe Api::V1::TalksController, type: :controller do
  let!(:artwork) { create(:artwork) }
  let(:client) { create(:client) }
  let(:talk) { create(:talk, user_id: client.id, artwork_id: artwork.id) }

  describe 'GET #index' do
    before(:each) do
      talk
      get :index
    end

    it 'populates an array of talks' do
      talks_response = json_response
      expect(talks_response.size).to eql 1
    end

    it { should respond_with 200 }
  end

  describe 'GET #show' do
    before(:each) do
      talk
      get :show, params: { id: talk.id }
    end

    it 'renders the talk json' do
      talk_response = json_response
      expect(talk_response[:user][:id]).to eql client.id
    end

    it { should respond_with 200 }
  end

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