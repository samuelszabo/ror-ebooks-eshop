# frozen_string_literal: true

require './app/models/user'
require 'money'
require 'money/collection'

module Carts
  # Store Cart Items
  class Cart
    def initialize(cart_items = [])
      @items = cart_items
    end

    def add(item)
      @items << item
    end

    attr_reader :items

    def pieces
      @items.count
    end

    def price
      c = Money::Collection.new(@items.map(&:price))
      c.sum
    end
  end
end
