class BlogTag < ActiveRecord::Base
  has_many :blog_tag_refs
  has_many :blogs, through: :blog_tag_refs

  validates :name, presence: true

  before_create :create_slug

  scope :all_with_counts, select('blog_tags.*, count(blog_tag_refs.blog_id) as count').joins(:blog_tag_refs).order('blog_tags.name').group('blog_tags.id')

  def to_param
    slug
  end

  def create_slug
    self.slug = name.parameterize '_'
  end
end
