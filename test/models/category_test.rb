require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup 
    @category = Category.new(name: "Sports") 
  end

  test "Category should be valid" do #Model Test
    assert @category.valid?
  end

  test "Name Should Be Present" do #Validation Test
    @category = Category.new(name: " ")
    assert_not @category.valid?
  end

  test "Name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "Name Should not be too long" do
    @category.name = "a" * 20
    assert_not @category.valid?
  end

  test "Name should not be to short" do
    @category.name = "a" * 3
    assert_not @category.valid?
  end

end