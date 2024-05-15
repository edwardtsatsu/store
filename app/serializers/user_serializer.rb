# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :diagnostic_level, :current_level, :first_message_timestamp, :last_message_timestamp,
             :active_status

  has_many :messages
end
