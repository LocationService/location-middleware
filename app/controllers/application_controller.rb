class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
end

# TODO: add device register endpoint with jwt
# TODO: add device auth endpoint with jwt