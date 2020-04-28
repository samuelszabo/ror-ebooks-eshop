class OrderItemsController < ApplicationController
  before_action :set_order_item

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
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = current_user.orders.order_items.find(params[:id]) #todo, i am not sure this is working
    end
end
