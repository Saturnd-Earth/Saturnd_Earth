class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.float :latitude
      t.float :longitude
      t.integer :ring_min_max, :default => 0

      t.timestamps
    end
  end
end
