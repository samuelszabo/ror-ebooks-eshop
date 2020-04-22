require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:two)
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "raise get new" do
    assert_raise Exception do
      get new_product_url
    end
  end

  test "raise create product" do
    assert_raise Exception do
      post products_url, params: {product: {name: @product.name}}
    end
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "raise get edit" do
    assert_raise Exception do
      get edit_product_url(@product)
    end
  end

  test "raise update product" do
    assert_raise Exception do
      patch product_url(@product), params: {product: {name: @product.name}}
    end
  end

  test "raise destroy product" do
    assert_raise Exception do
      delete product_url(@product)
    end
  end
end
