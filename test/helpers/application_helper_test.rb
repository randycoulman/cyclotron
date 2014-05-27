require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def test_full_title_includes_page_title
    assert_match(/foo/, full_title("foo"))
  end

  def test_full_title_includes_base_title
    assert_match(/^Cyclotron -/, full_title("foo"))
  end

  def test_full_title_is_base_title_when_no_page_title
    assert_equal("Cyclotron", full_title(""))
  end
end
