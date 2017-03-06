class Api::V1::MessagesController < ApplicationController
  def create
    message = User.first.messages.new(message_params)
    if message.save
      render json: message, status: 201
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  private
    def message_params
      params.require(:message).permit(:body).merge(talk_id: params[:talk_id])
    end
end