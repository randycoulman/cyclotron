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

  def test_cant_delete_a_route_thats_been_ridden
    route.save!
    create(:ride, route: route)
    route.destroy
    assert_nothing_raised(ActiveRecord::RecordNotFound) { route.reload }
  end

  def test_can_delete_an_unridden_route
    route.save!
    route.destroy
    assert_raises(ActiveRecord::RecordNotFound) { route.reload }
  end
end
