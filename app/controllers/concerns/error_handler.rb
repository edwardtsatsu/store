# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    ApiException::EXCEPTIONS.each do |exception_name, rescue_data|
      unless ApiException.const_defined?(exception_name)
        ApiException.const_set(exception_name, Class.new(ApiException::BaseError))

        exception_name = "ApiException::#{exception_name}"
      end

      rescue_from exception_name do |err|
        data = { code: rescue_data[:status_code], message: rescue_data[:message] || err.message }

        render ApiResponse.send(rescue_data[:status_code], data)
      end
    end
  end
end
