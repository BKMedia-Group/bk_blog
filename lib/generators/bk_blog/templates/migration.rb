class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :user_id
      t.integer :blog_category_id
      t.text :intro_text
      t.text :full_text
      t.attachment :image
      t.boolean :published
      t.string :slug

      t.timestamps
    end

    add_index :blogs, :published
    add_index :blogs, :slug, unique: true
    add_index :blogs, :category_id

    create_table :blog_categories do |t|
      t.string :name
      t.boolean :published
      t.attachment :image
      t.string :slug
      t.text :description

      t.timestamps
    end

    add_index :blog_categories, :slug, unique: true
    add_index :blog_categories, :published
  end
end
