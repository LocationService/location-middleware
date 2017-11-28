module Devices
  class LocationsController < AuthenticateController
    def create
      location = current_device.locations.create(location_params)
      if location.persisted?
        render jsonapi: location, status: :created
      else
        render jsonapi_errors: location.errors, status: :unprocessable_entity
      end
    end

    private

    def location_params
      params.require(:location).permit(:lat, :lng)
    end
  end
end