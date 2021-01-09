class ChangePostColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :content, :text
    add_column :posts, :url, :string
    add_column :posts, :type, :string
  end
end
