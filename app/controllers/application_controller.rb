# frozen_string_literal: true

require 'carts/cart'
require 'carts/cart_item'

class ApplicationController < ActionController::Base
  before_action :current_cart

  def require_admin!
    raise Exception unless current_user&.admin # this should be some auth exception
  end

  def current_cart
    cart_items = session['shopping_cart'] ? session['shopping_cart'].map { |product_id| Carts::CartItem.new Product.find(product_id) } : []
    @cart = Carts::Cart.new cart_items
  end

  def cart_add(product)
    cart_item = Carts::CartItem.new product
    @cart.add cart_item
    cart_save
  end

  def cart_save
    session['shopping_cart'] = @cart.items.map(&:product_id)
  end

  def pr(var)
    puts "\n\e[33m#{var.inspect}\e[0m\n\n"
  end

  def dd(var)
    pr var
    exit
  end
end
