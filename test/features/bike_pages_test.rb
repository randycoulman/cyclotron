require "test_helper"

class NewBikeTest < Capybara::Rails::TestCase
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
    assert_selector("div.flash.flash-notice", text: "success")
  end

  private

  def submit
    click_button "Create Bike"
  end
end

class EditBikeTest < Capybara::Rails::TestCase
  attr_reader :bike

  def setup
    @bike = create(:bike)
    visit edit_bike_path(bike)
  end

  def test_edit_bike_page
    assert_content("Update Bike")
    assert_title("Update Bike")
  end

  def test_doesnt_update_invalid_bike
    fill_in "Name", with: " "
    submit
    assert_title("Update Bike")
    assert_content("error")
  end

  def test_updates_valid_bike
    new_name = "New name"
    fill_in "Name", with: new_name
    submit
    assert_title("Bikes")
    assert_content(new_name)
    assert_selector("div.flash.flash-notice", text: "success")
    assert_equal(new_name, bike.reload.name)
  end

  private

  def submit
    click_button "Update Bike"
  end
end
