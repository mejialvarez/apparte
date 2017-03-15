class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.find_by(email: auth_params[:email])

    if user.present? && user.authenticate(auth_params[:password])
      jwt = JsonWebToken.encode({ user: user.id })
      
      render json: { jwt: jwt }, status: :ok
    else
      render json: { errors: ['Invalid Email/Password'] }, status: :unauthorized
    end
  end

  private

    def auth_params
      params.require(:auth).permit(:email, :password)
    end
end