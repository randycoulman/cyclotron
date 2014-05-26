class Ride < ActiveRecord::Base
  belongs_to :bike
  belongs_to :route
end
