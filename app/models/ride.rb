class Ride < ActiveRecord::Base
  belongs_to :bike
  belongs_to :route

  validates :bike_id, presence: true
  validates :route_id, presence: true
  validates :ride_date, presence: true
  validates :distance, numericality: {greater_than: 0}
  validates :speed, numericality: {greater_than: 0}
end
