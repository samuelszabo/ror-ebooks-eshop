# frozen_string_literal: true

class AddUsersToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
