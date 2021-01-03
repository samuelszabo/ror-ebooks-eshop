# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order_item

  # GET /orders_items/1
  # GET /orders_items/1.json
  def show
    @links = download_links
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id]) # TODO: valid user!
    raise 'unauthorized' until @order_item.order.user.id == current_user.id
  end

  def download_links
    # test create license
    client = Dibuk::Client.new(seller_id: ENV['DIBUK_SELLER_ID'], signature: ENV['DIBUK_SIGNATURE'], sandbox: ENV['DIBUK_SANDBOX'] == '1')

    user = Dibuk::User.new(
      id: @order_item.order.user.id.to_s, # user id from your database
      email: @order_item.order.user.email,
      name: @order_item.order.address.first_name,
      surname: @order_item.order.address.surname
    )

    pr @order_item.price_currency

    item = Dibuk::Item.new(
      id: '14345',
      order_id: @order_item.order_id.to_s, # user\`s order id
      payment_id: 'int', # payment_channel
      price: @order_item.price.format(symbol: false),
      currency: @order_item.price_currency,
      unique_id: @order_item.id.to_s
    )

    licensed = client.license(user, item)
    pr licensed.success?
    # pr licensed.error_code
    # pr licensed.body

    # sent = client.send(user, item, 'samuel.szabo@martinus.sk')
    client.links(user, item).all
  end
end
