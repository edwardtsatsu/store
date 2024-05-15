# frozen_string_literal: true

class ApiResponse
  def self.send(status_code, data)
    { json: { status_code: status_code, data: data }, status: status_code }
  end
end
