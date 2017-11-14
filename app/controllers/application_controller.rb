class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user
end

# TODO: add device register endpoint
# TODO: add device auth endpoint