require 'test_helper'
class CartTest
  test "should create cart" do
    cart = Carts::Cart.new('test')
    assert cart
  end
end