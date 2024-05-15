# frozen_string_literal: true

module UserService
  class Create < BaseService
    attr_reader :user_attributes

    def initialize(user_attributes)
      @user_attributes = user_attributes
    end

    def call
      with_transaction do
        user = save_user_deatils
        create_messages(user)
        {message: 'Record created successfully'}
      end
    end

    private

    def save_user_deatils
      User.create!(@user_attributes.except(:message_ids))
    end

    def create_messages(user)
      message_ids = @user_params[:message_ids] || []
      message_ids.each do |message_id|
        user.messages.create(id: message_id)
      end
    end
  end
end
