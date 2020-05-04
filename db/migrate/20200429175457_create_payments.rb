class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :variable_symbol
      t.monetize :price
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
