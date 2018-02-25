class Api::V1::LocationsController < AuthenticateController
  def index
    params.require([:device_id, :date])
    render jsonapi: device.locations.for_date(date)
  end

  private

  def device
    Device.find(params[:device_id])
  end

  def date
    current_user.time_zone.parse(params[:date])
  end
end
