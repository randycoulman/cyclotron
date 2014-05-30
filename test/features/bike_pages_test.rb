require "test_helper"

class NewBikeTest < Capybara::Rails::TestCase
  def setup
    visit new_bike_path
  end

  def test_new_bike_page
    assert_title("New Bike")
    assert_content("New Bike")
  end

  def test_doesnt_create_invalid_bike
    assert_no_difference(-> {Bike.count}) do
      submit
    end
    assert_title("New Bike")
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

class ListBikesTest < Capybara::Rails::TestCase
  def setup
    create(:bike, name: "Road Bike")
    create(:bike, name: "Mountain Bike")
    visit bikes_path
  end

  def test_list_bikes_page
    assert_title("Bikes")
    assert_content("Bikes")
  end

  def test_lists_each_bike
    Bike.all.each do |bike|
      assert_content(bike.name)
    end
  end
end

class DeleteBikeTest < Capybara::Rails::TestCase
  attr_reader :bike

  def setup
    @bike = create(:bike)
    visit bikes_path
  end

  def test_has_delete_link
    assert_link("Destroy")
  end

  def test_can_delete_a_bike
    assert_difference(-> { Bike.count }, -1) do
      click_link("Destroy", match: :first)
    end
  end
end
