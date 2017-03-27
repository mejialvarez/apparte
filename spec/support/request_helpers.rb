module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end

    def sign_in(user)
      @jwt ||= JsonWebToken.encode({ user: user.id })
      request.headers['Authorization'] = "Bearer #{@jwt}"
    end
  end
end