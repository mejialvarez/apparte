require 'rails_helper'

describe Api::V1::MessagesController, type: :controller do
  let!(:talk) { create(:talk) }
  let(:message_params) { attributes_for(:message) }
  let(:message_invalid_params) { attributes_for(:invalid_message) }

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        post :create, params: { talk_id: talk.id, message: message_params }
      end

      it 'renders message json' do
        message_response = json_response
        expect(message_response[:body]).to eql message_params[:body]
      end

      it { should respond_with 201 }
    end

    context 'with invalid params' do
      before(:each) do
        post :create, params: { talk_id: 0, message: message_invalid_params }
      end

      it 'renders the json url errors' do
        message_response = json_response
        expect(message_response[:errors][:talk]).to include 'must exist'
      end

      it 'renders the json params errors' do
        post :create, params: { talk_id: talk.id, message: message_invalid_params }
        message_response = json_response
        expect(message_response[:errors][:body]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end