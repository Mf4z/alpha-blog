require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category_holiday = Category.create(name: "Holidays")
    @category_business = Category.create(name: "Business")
  end

  test "should show categories listing" do
    get "/categories"
    assert_select "a[href=?]", category_path(@category_holiday), text: @category_holiday.name
    assert_select "a[href=?]", category_path(@category_business), text: @category_business.name
  end
end
