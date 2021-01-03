# frozen_string_literal: true

class DropPost < ActiveRecord::Migration[6.0]
  def change
    drop_table :posts
  end
end
