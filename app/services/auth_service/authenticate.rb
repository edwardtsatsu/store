# frozen_string_literal: true

module AuthService
  class Authenticate < BaseService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def call
      validate_user
      generate_user_token
    end

    private

    def validate_user
      @user = User.find_by(email: @email)
      return if @user&.authenticate(@password)

      raise ApiException::AuthenticationError
    end

    def generate_user_token
      { token: JsonWebToken.encode({ user_id: @user.id }) }
    end
  end
end
