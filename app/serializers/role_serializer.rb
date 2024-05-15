# frozen_string_literal: true

class RoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :active_status, :del_status
end
