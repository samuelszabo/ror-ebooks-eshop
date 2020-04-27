class CartsController < ApplicationController
  before_action :set_product, only: [:create]

  def create

    cart_add @product
    puts @cart.inspect
    redirect_to @product, notice: 'Product was successfully added to cart.'

    #respond_to do |format|
    #  if @post.save
    #    format.html { redirect_to @post, notice: 'Product was successfully added to cart.' }
    #    format.json { render :show, status: :created, location: @post }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @post.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  def index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:product_id])
  end
end