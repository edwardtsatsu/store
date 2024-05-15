# frozen_string_literal: true

module UserService
  class Find < BaseService
    def initialize(user_attributes = {})
      @user_attributes = user_attributes
    end

    def call
      find_user_by_id
    end

    def find_user_by_id
      user = User.find_by(id: user_id)
      UserSerializer.new(user)
    end
  end
end
