require 'test_helper'
class CartTest
  test "should create cart" do
    cart = Carts::Cart.new([])
    assert cart
  end
end