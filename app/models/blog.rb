class Blog < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  attr_accessible :full_text, :intro_text, :title, :user_id, :slug, :created_at, :published, :image
  has_attached_file :image, styles: BkBlog::Engine.config.blog_image_styles

  belongs_to :user

  scope :published, where({ published: true })

  scope :ordered, order('created_at DESC')

  default_scope ordered

  def to_param
    slug
  end

  def author
    user.name
  end
  def date
    created_at.strftime '%-m/%-d/%Y'
  end
  def short_intro
    short = strip_tags intro_text.to_html
    short.length > 100 ? short[0..99]+'...' : short
  end
end
