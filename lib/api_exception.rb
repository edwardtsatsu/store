# frozen_string_literal: true

module ApiException
  EXCEPTIONS = {
    'InvalidParameter' => { status_code: 400 },
    'AuthenticationError' => { status_code: 400, message: 'Email or password not valid.' },
    'AuthorizationError' => { status_code: 400, message: 'Invalid request token.' },
    'ActiveRecord::RecordInvalid' => { status_code: 400 },
    'JWT::DecodeError' => { status_code: 401, message: 'A valid token must be passed.' },
    'JWT::ExpiredSignature' => { status_code: 401, message: 'The token has expired' },
    'JWT::InvalidIssuerError' => { status_code: 401, message: 'The token does not have a valid issuer.' }
  }.freeze

  class BaseError < StandardError
    def initialize(msg = '')
      super
    end
  end
end
