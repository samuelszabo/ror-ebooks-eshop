# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'address belongs to different user' do
    order = Order.new
    order.user = users(:one)
    order.address = addresses(:two)
    assert !order.save
  end

  test 'address belongs to same user' do
    order = Order.new
    order.user = users(:one)
    order.address = addresses(:one)
    assert order.save
  end
end
