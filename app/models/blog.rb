class Blog < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  include Slugable

  attr_accessible :full_text, :intro_text, :title, :user_id, :created_at, :published, :image, :blog_category_id
  has_attached_file :image,
                    styles: BkBlog::Engine.config.blog_image_styles,
                    convert_options: BkBlog::Engine.config.blog_image_convert

  belongs_to :user
  belongs_to :blog_category

  scope :published, where({ published: true })

  scope :ordered, order('created_at DESC')

  default_scope ordered

  validates :full_text, :blog_category_id, :intro_text, :title, presence: true

  def author
    user.name
  end
  def date
    created_at.strftime '%B %-d, %Y'
  end
  def short_intro
    short = strip_tags intro_text.to_html
    short.length > 100 ? short[0..99]+'...' : short
  end
end
