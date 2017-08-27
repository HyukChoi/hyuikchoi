class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :writer
      t.text :content
      t.img_url :img
      t.belongs_to :user

      t.timestamps
    end
  end
end
