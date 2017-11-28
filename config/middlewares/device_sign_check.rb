class DeviceSignCheck
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    if req.path =~ /^\/devices/ && req.post?
      signed_body = req.params["signed_body"]
      return bad_request unless signed_body
      data, sign = signed_body.split(".")
      return bad_request unless data && sign
      expect_sign = make_sign(data)
      return bad_request unless sign == expect_sign
    end

    @app.call(env)
  end

  private

  def bad_request
    [400, {}, []]
  end

  def make_sign(data)
    OpenSSL::HMAC.hexdigest(sign_digest, sign_key, data)
  end

  def sign_key
    ENV["SECRET_KEY_BASE"]
  end

  def sign_digest
    OpenSSL::Digest.new("sha256")
  end
end