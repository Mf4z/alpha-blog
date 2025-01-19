require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "catergory should be valid" do
    @category = Category.new(name: "News")
    assert @category.valid?
  end
end