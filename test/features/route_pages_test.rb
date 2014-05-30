require 'test_helper'

class NewRouteTest < Capybara::Rails::TestCase
  def setup
    visit new_route_path
  end

  def test_new_route_page
    assert_title("New Route")
    assert_content("New Route")
  end

  def test_doesnt_create_invalid_route
    assert_no_difference(-> {Route.count}) do
      submit
    end
    assert_title("New Route")
    assert_content("error")
  end

  def test_creates_valid_route
    fill_in "Name", with: "A route"
    fill_in "Description", with: "A description"
    assert_difference(-> {Route.count}) do
      submit
    end
    assert_title("Routes")
    assert_content("A route")
    assert_selector("div.flash.flash-notice", text: "success")
  end

  private

  def submit
    click_button "Create Route"
  end
end
