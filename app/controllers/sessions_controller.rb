class SessionsController < Knock::AuthTokenController
  private

  def entity_class
    User
  end
end
