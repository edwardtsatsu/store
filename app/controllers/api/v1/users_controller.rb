# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request

      def store_user_details
        user_params = validate_params(UserContract::Create, params.permit!.to_h)

        user_data = UserService::Create.call(user_params)

        render ApiResponse.send(200, user_data)
      end

      def find_user_by_id
        response = UserService::Find.call(params)

        render ApiResponse.send(200, response)
      end
    end
  end
end
