class Route < ActiveRecord::Base
  has_many :rides, dependent: :restrict_with_error

  validates :name, presence: true, length: {maximum: 50}
end
