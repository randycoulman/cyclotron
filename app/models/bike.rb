class Bike < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 30}
end
