require 'test_helper'

class RouteTest < ActiveSupport::TestCase
  attr_reader :route

  def setup
    @route = Route.new(name: "Favorite", description: "My favorite route")
  end

  def test_has_a_name
    assert_equal "Favorite", route.name
  end

  def test_has_a_description
    assert_equal "My favorite route", route.description
  end

  def test_is_valid
    assert route.valid?
  end

  def test_must_have_a_name
    route.name = "  "
    refute route.valid?
  end

  def test_name_cant_be_too_long
    route.name = "a" * 51
    refute route.valid?
  end

  def test_allows_blank_description
    route.description = ""
    assert route.valid?
  end
end
