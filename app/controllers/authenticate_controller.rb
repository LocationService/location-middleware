class AuthenticateController < ApplicationController
  include Knock::Authenticable
  before_action :authenticate_user
end