module Devices
  class AuthenticateController < ApplicationController
    before_action :authenticate!

    private

    def authenticate!
      unauthorize! unless current_device
    end

    def unauthorize!
      head(:unauthorized)
    end

    def current_device
      return @current_device if @current_device
      device_id = entity_token&.payload&.dig("device_id")
      return unless device_id
      @current_device = Device.find(device_id)
    end

    def entity_token
      return unless token
      Knock::AuthToken.new(token: token) rescue nil
    end

    def token
      return if request.headers["Authorization"].blank?
      request.headers["Authorization"].split.last
    end
  end
end
