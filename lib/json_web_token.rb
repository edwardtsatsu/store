# frozen_string_literal: true

class JsonWebToken
  def self.encode(payload, exp = 2.days.from_now.to_i)
    JWT.encode payload.merge(exp: exp), ENV['EM_API_SECRETE'], 'HS256'
  end

  def self.decode(token)
    JWT.decode token, ENV['EM_API_SECRETE'], true, { algorithm: 'HS256' }
  end
end
