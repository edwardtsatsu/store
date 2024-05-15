# frozen_string_literal: true

module AuthService
  class Authorize < BaseService
    def initialize(headers)
      @headers = headers
    end

    def call
      decode_token
    end

    private

    def decode_token
      token_payload = JsonWebToken.decode(token).first

      user = User.find(token_payload['user_id'])
      raise raise ApiException::AuthorizationError unless user

      user
    end

    def token
      bearer_token = @headers['HTTP_AUTHORIZATION']
      raise ApiException::AuthorizationError unless bearer_token

      bearer_token.split(' ').last
    end
  end
end
