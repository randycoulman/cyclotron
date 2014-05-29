require "test_helper"

class BikePagesTest < Capybara::Rails::TestCase
  def setup
    visit new_bike_path
  end

  def test_new_bike_page
    assert_title("New bike")
    assert_content("New bike")
  end

  def test_doesnt_create_invalid_bike
    assert_no_difference(-> {Bike.count}) do
      submit
    end
    assert_title("New bike")
    assert_content("error")
  end

  def test_creates_valid_bike
    fill_in "Name", with: "A bike"
    assert_difference(-> {Bike.count}) do
      submit
    end
    assert_title("Bikes")
    assert_content("A bike")
    assert_selector('div.flash.flash-notice', text: 'success')
  end

  private

  def assert_title(text)
    assert(page.has_title?(text))
  end

  def submit
    click_button "Create Bike"
  end
end
