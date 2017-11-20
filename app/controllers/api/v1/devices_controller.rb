class Api::V1::DevicesController < AuthenticateController
  def index
    render jsonapi: Device.all
  end
end
