class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :address, null: false, foreign_key: true
      t.datetime :paid
      t.enum :state

      t.timestamps
    end
  end
end
