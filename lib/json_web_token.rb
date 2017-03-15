class JsonWebToken
  class << self
    ALGORITHM = 'HS256'
    AUTH_SECRET = Rails.application.secrets.secret_key_base

    def encode(payload)
      JWT.encode(payload, AUTH_SECRET, ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, AUTH_SECRET, true, { algorithm: ALGORITHM }).first
    end
  end
end