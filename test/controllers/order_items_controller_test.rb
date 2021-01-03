# frozen_string_literal: true

require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item = order_items(:one)
  end

  # test "should destroy order_item" do
  #  sign_in users(:one)
  #  assert_difference('OrderItem.count', -1) do
  #    delete order_item_url(@order_item)
  #  end
  #
  #  assert_redirected_to order_items_url
  # end
end
