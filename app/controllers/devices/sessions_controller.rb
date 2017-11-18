module Devices
  class SessionsController < ApplicationController
    before_action :authenticate!

    def create
      render json: auth_token, status: :created
    end

    private

    def authenticate!
      unless entity.present? && entity.authenticate(auth_params[:token])
        raise Knock.not_found_exception_class
      end
    end

    def auth_token
      Knock::AuthToken.new payload: { device_id: entity.id }
    end

    def entity
      @entity ||= entity_class.find_by(device_id: auth_params[:device_id])
    end

    def entity_class
      Device
    end

    def auth_params
      params.require(:auth).permit(:device_id, :token)
    end
  end
end