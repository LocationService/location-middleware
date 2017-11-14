class Api::V1::DevicesController < AuthenticateController
  def index
    render jsonapi: current_user.devices
  end
end
