# frozen_string_literal: true

class CreatePosts2 < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
