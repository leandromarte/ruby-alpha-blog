require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @cat1 = Category.create(name: "Cat1")
    @cat2 = Category.create(name: "Cat2")
  end
  
  test "should get listing" do
    get categories_path
    assert_template 'categories/index'
    
    assert_select "a[href=?]", category_path(@cat1), text: @cat1.name
    assert_select "a[href=?]", category_path(@cat2), text: @cat2.name
  end

  
end