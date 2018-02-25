class Location < ApplicationRecord
  belongs_to :device

  validates :lat, :lng, presence: true

  scope :for_date, ->(date) { where("created_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day) }
end
