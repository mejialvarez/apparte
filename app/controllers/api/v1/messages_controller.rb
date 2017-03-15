class Api::V1::MessagesController < ApplicationController
  def create
    message = current_user.messages.new(message_params)
    if message.save
      render json: message, status: :created
    else
      render json: { errors: message.errors }, status: :unprocessable_entity
    end
  end

  private
    def message_params
      params.require(:message).permit(:body).merge(talk_id: params[:talk_id])
    end
end