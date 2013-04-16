class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :user_id
      t.text :intro_text
      t.text :full_text
      t.attachment :image
      t.boolean :published
      t.string :slug

      t.timestamps
    end
  end
end
