# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  def self.call(params)
    new.call(params)
  end
end
