module Carts
  # Store Cart item
  class CartItem
    def initialize(product)
      @product_id = product.id
      @price = product.price
    end

    attr_reader :product_id
    attr_reader :price
  end
end
