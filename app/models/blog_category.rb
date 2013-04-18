class BlogCategory < ActiveRecord::Base
  include Slugable

  attr_accessible :description, :name, :published, :image
  has_attached_file :image,
                    styles: BkBlog::Engine.config.blog_image_styles,
                    convert_options: BkBlog::Engine.config.blog_image_convert

  has_many :blogs

  scope :published, where(published: true)
  scope :greedy, includes(:blogs)

  validates :name, :description, presence: true

  # required for slugable to generate a slug automagically
  def title
    name
  end
end
