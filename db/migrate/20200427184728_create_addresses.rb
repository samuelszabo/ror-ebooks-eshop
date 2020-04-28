class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :first_name
      t.string :surname
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
