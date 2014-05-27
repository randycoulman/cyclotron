require 'test_helper'

class RideTest < ActiveSupport::TestCase
  attr_reader :ride, :bike, :route

  def setup
    @bike = Bike.create!(name: "A bike")
    @route = Route.create!(name: "A route")
    @ride = Ride.new(bike: @bike, route: @route, ride_date: Date.today, distance: 12.345, speed: 16.7)
  end

  def test_knows_its_bike
    assert_equal bike, ride.bike
  end

  def test_knows_its_route
    assert_equal route, ride.route
  end

  def test_has_a_ride_date
    assert_equal Date.today, ride.ride_date
  end

  def test_has_a_distance
    assert_equal(12.345, ride.distance)
  end

  def test_has_a_speed
    assert_equal(16.7, ride.speed)
  end

  def test_is_valid
    assert ride.valid?
  end

  def test_must_have_a_bike
    ride.bike_id = nil
    refute ride.valid?
  end

  def test_must_have_a_route
    ride.route_id = nil
    refute ride.valid?
  end

  def test_must_have_a_ride_date
    ride.ride_date = nil
    refute ride.valid?
  end

  def test_must_have_a_numerical_distance
    ride.distance = "not a number"
    refute ride.valid?
  end

  def test_must_have_a_positive_distance
    ride.distance = 0
    refute ride.valid?
  end

  def test_must_have_a_numerical_speed
    ride.speed = "not a number"
    refute ride.valid?
  end

  def test_must_have_a_positive_speed
    ride.speed = 0
    refute ride.valid?
  end
end
