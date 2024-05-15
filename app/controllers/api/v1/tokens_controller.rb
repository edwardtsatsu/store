# frozen_string_literal: true

module Api
  module V1
    class TokensController < ApplicationController
      skip_before_action :authorize_request

      def create
        valid_params = validate_params(TokenContract::Create, params.permit!.to_h)

        response = AuthService::Authenticate.call(valid_params)

        render ApiResponse.send(200, response)
      end
    end
  end
end
