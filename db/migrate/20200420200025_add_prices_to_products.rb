class AddPricesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_money :products, :price
  end
end
