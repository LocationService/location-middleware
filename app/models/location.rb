class Location < ApplicationRecord
  belongs_to :device

  validates :lat, :lng, presence: true
end
