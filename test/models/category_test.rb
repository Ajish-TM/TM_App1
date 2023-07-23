require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category =Category.new(name:"Sports")

    end
    test "category should be vaild" do
        
        assert @category.valid?
    end

    test "category should be present" do
        @category.name=""
        assert_not @category.valid?

    end

    test "category should be unique" do
@category.save
@category1=Category.new(name:"Sports")
assert_not @category1.valid?
    end

    test "category should not be too short" do
        @category.name="aa"        
        assert_not @category.valid?
    end

    test "category should not be too long" do
        @category.name="12345678901234567890234567"
        assert_not @category.valid?
    end

end