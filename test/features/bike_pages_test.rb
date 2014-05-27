require "test_helper"

class BikePagesTest < Capybara::Rails::TestCase
  def test_new_bike_page
    visit new_bike_path
    assert_content("New bike")
  end

  def test_shows_bike_name
    bike = Bike.create!(name: "My bike")
    visit bike_path(bike)
    assert_content("My bike")
  end
end
