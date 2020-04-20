class ChangePostsContentName < ActiveRecord::Migration[6.0]
  def up
    rename_column :posts, :text, :content
    change_column :posts, :content, :text
  end
  def down
    rename_column :posts, :content, :text
    change_column :posts, :text, :string
  end
end
