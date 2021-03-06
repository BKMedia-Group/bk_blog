class Blog < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper
  include Slugable

  has_attached_file :image,
                    styles: BkBlog::Engine.config.blog_image_styles,
                    convert_options: BkBlog::Engine.config.blog_image_convert

  belongs_to :user
  belongs_to :blog_category
  has_many :blog_tag_refs
  has_many :blog_tags, through: :blog_tag_refs
  has_many :blog_attachments

  accepts_nested_attributes_for :blog_attachments, reject_if: :all_blank, allow_destroy: true

  scope :published, where({ published: true })

  scope :ordered, order('created_at DESC')

  default_scope ordered

  validates :full_text, :intro_text, :title, presence: true

  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

  def author
    user.try(:name) || 'Unknown'
  end
  def date
    created_at.strftime '%B %-d, %Y'
  end
  def short_intro
    short = strip_tags intro_text.to_html
    short.length > 100 ? short[0..99]+'...' : short
  end
  def tag_list=(names)
    self.blog_tags = names.split(',').reject {|n| n.strip.length < 1 }.map do |n|
      BlogTag.where(name: n.strip).first_or_create!
    end
  end
  def tag_list
    blog_tags.map(&:name).join ', '
  end
  def day
    created_at.day
  end
  def month
    Date::ABBR_MONTHNAMES[created_at.month]
  end
end
