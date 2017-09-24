class Api::V1::DevicesController < ApplicationController
  def index
    render jsonapi: current_user.devices
  end
end
