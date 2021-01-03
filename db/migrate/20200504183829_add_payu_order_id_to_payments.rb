# frozen_string_literal: true

class AddPayuOrderIdToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :payu_order_id, :string
  end
end
