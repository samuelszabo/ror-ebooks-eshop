# frozen_string_literal: true

module Carts
  # Store Cart item
  class CartItem
    def initialize(product)
      @product_id = product.id
      @price = product.price
      @product = product
    end

    attr_reader :product_id
    attr_reader :price
    attr_reader :product
  end
end
