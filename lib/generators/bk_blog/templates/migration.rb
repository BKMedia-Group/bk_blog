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
    add_index :blogs, :blog_category_id

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

    create_table :blog_tags do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :blog_tags, :name, unique: true
    add_index :blog_tags, :slug, unique: true

    create_table :blog_tag_refs do |t|
      t.integer :blog_id
      t.integer :blog_tag_id

      t.timestamps
    end

    add_index :blog_tag_refs, :blog_id
    add_index :blog_tag_refs, :blog_tag_id
    add_index :blog_tag_refs, [:blog_id, :blog_tag_id], unique: true
  end
end
