class ChangePostColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :url, :string
    add_column :posts, :post_type, :string
  end
end
