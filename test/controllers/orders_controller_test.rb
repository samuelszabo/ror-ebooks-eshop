# frozen_string_literal: true

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @order = orders(:one)
  end

  test 'should get index' do
    get orders_url
    assert_response :success
  end

  test 'should get new' do
    # TODO: session cart
    get new_order_url
    assert_response :success
  end

  test 'should create order' do
    # TODO: session cart
    assert_difference('Order.count') do
      post orders_url, params: { order: { address_id: @order.address_id, paid: @order.paid, state: @order.state, user_id: @order.user_id } }
    end
    # TODO: assert saving order_items
    assert_redirected_to order_url(Order.last)
  end

  test 'should show order' do
    get order_url(@order)
    assert_response :success
  end
end
