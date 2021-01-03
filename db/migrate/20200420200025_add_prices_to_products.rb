# frozen_string_literal: true

class AddPricesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :products, :price
  end
end
