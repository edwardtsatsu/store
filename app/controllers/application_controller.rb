# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler

  rescue_from ActionDispatch::Http::Parameters::ParseError, with: :handle_parse_error

  def handle_parse_error(exception)
    error_message = "Malformed Json: #{exception.message}"

    render json: { error: true, status_code: 400, data: { status_code: 400, message: error_message } }
  end

  def validate_params(contract, params)
    input = contract.call(params)

    unless input.success?
      error_messages = input.errors(full: true).map(&:text)
      raise ApiException::InvalidParameter, format_error_message(error_messages.first)
    end

    input.to_h
  rescue ActiveRecord::RecordInvalid => e
    error_messages = e.record.errors.full_messages
    Rails.logger.info("=====ACTIVE RECORD ERROR: #{error_messages.first}===")
    raise ApiException::InvalidParameter, error_messages.first
  end

  def format_error_message(error_message)
    error_message.include?(',') ? error_message.split(',').last.humanize(keep_id_suffix: true) : error_message
  end

  def authorize_request
    @user = AuthService::Authorize.call(request.headers)
  end

  def route_not_found
    raise ApiException::RouteNotFoundException
  end
end
