require 'test_helper'

class BikeTest < ActiveSupport::TestCase
  attr_reader :bike

  def setup
    @bike = Bike.new(name: 'Speed Racer')
  end

  def test_has_a_name
    assert_equal "Speed Racer", bike.name
  end

  def test_is_valid
    assert bike.valid?
  end

  def test_must_have_a_name
    bike.name = " "
    refute bike.valid?
  end

  def test_name_cant_be_too_long
    bike.name = "a" * 31
    refute bike.valid?
  end
end
