# frozen_string_literal: true

module UserContract
  class Create < ApplicationContract
    params do
      required(:name).maybe(:string)
      required(:phone_number).filled(:string)
      required(:email).maybe(:string)
      required(:diagnostic_level).filled(:integer, included_in?: 0..10)
      required(:current_level).filled(:integer, included_in?: 0..10)
      required(:first_message_timestamp).filled(:date_time)
      required(:last_message_timestamp).filled(:date_time)
      required(:message_ids).array(:string)
    end

    rule(:email) do
      unless value.blank? || /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.match?(value)
        key.failure(',provide a valid email')
      end
    end

    rule(:message_ids) do
      key.failure(',must contain unique values') unless value.uniq.length == value.length
    end
  end
end
