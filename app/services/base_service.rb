# frozen_string_literal: true

class BaseService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def with_transaction(&block)
    ActiveRecord::Base.transaction do
      block.call
    end
  end
end
