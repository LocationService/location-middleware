class Api::V1::UsersController < AuthenticateController
  def show
    render jsonapi: current_user
  end
end
