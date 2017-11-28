class Device < ApplicationRecord
  has_many :locations

  attr_reader :token

  validates :device_id, presence: true, uniqueness: true

  # validate do |record|
  #   record.errors.add(:token, :blank) unless record.token_digest.present?
  # end

  def authenticate(unencrypted_token)
    BCrypt::Password.new(token_digest).is_password?(unencrypted_token) && self
  end

  def token=(unencrypted_token)
    if unencrypted_token.present?
      @token = unencrypted_token
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      self.token_digest = BCrypt::Password.create(unencrypted_token, cost: cost)
    else
      self.token_digest = nil
    end
  end
end
