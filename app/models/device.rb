class Device < ApplicationRecord
  has_many :locations
  belongs_to :user

  validates :did, :user_agent, presence: true
end
