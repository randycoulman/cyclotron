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

class EditRouteTest < Capybara::Rails::TestCase
  attr_reader :route

  def setup
    @route = create(:route)
    visit edit_route_path(route)
  end

  def test_edit_route_page
    assert_title("Update Route")
    assert_content("Update Route")
  end

  def test_doesnt_update_invalid_route
    fill_in "Name", with: " "
    submit
    assert_title("Update Route")
    assert_content("error")
  end

  def test_updates_valid_route
    new_name = "New name"
    new_description = "New description"
    fill_in "Name", with: new_name
    fill_in "Description", with: new_description
    submit
    assert_title(new_name)
    assert_content(new_name)
    assert_content(new_description)
    assert_selector("div.flash.flash-notice", text: "success")
    reloaded = route.reload
    assert_equal(new_name, reloaded.name)
    assert_equal(new_description, reloaded.description)
  end

  private

  def submit
    click_button "Update Route"
  end
end
