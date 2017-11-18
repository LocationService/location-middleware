module Devices
  class AuthenticateController < ApplicationController
    before_action :authenticate!
    attr_reader :current_device

    private

    def authenticate!
      unauthorize unless authenticate_device
    end

    def unauthorize
      head(:unauthorized)
    end

    def authenticate_device
      payload = token_payload
      return unless payload
      device_id = payload["device_id"]
      return unless device_id
      @current_device = Device.find(device_id)
    end

    def token_payload
      return unless token
      Knock::AuthToken.new(token: token).payload
    rescue JWT::IncorrectAlgorithm, JWT::DecodeError
    end

    def token
      return if request.headers["Authorization"].blank?
      request.headers["Authorization"].split.last
    end
  end
end
