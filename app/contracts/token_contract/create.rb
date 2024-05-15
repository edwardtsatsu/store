# frozen_string_literal: true

module TokenContract
  class Create < ApplicationContract
    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    rule(:email) do
      key.failure('provide a valid email') unless /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.match?(value)
    end
  end
end
