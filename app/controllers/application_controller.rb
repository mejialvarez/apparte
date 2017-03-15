class ApplicationController < ActionController::API
  include ActionController::Serialization

  before_action :authenticate

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= auth_user
  end

  def authenticate
    render json: { error: 'Invalid token' }, status: :unauthorized unless signed_in?
  end

  private

    def token
      request.headers['Authorization'].scan(/Bearer (.*)$/).flatten.first
    end

    def auth_user
      begin
        auth = JsonWebToken.decode(token)
        User.find(auth['user'])
      rescue
        nil
      end
    end
end
