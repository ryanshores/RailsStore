require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path
    assert_response :success
  end

  test "should get product" do
    get product_path(1)
    assert_response :missing
  end
end
