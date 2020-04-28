class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.all
  end

  ## GET /orders/1
  ## GET /orders/1.json
  #def show
  #end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = current_user.orders.new(order_params)
    @cart.items.each do |item|
      @order.order_items.build(product_id: item.product_id, price: item.price)
    end


    respond_to do |format|
      if @order.save
        session.delete(:shopping_cart)
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = current_user.orders.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:address_id, :order_items_attributes)
  end
end
