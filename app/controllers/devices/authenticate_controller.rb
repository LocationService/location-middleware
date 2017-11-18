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
      entity_token = build_entity_token
      return unless entity_token
      device_id = entity_token.payload["device_id"]
      return unless device_id
      @current_device = Device.find(device_id)
    end

    def build_entity_token
      return unless token
      Knock::AuthToken.new(token: token)
    rescue JWT::IncorrectAlgorithm, JWT::DecodeError
    end

    def token
      return if request.headers["Authorization"].blank?
      request.headers["Authorization"].split.last
    end
  end
end
