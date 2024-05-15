# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :name, :active_status, :del_status
end
