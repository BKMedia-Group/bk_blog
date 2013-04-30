class BlogTag < ActiveRecord::Base
  attr_accessible :name, :slug

  has_many :blog_tag_refs
  has_many :blogs, through: :blog_tag_refs

  validates :name, presence: true

  before_create :create_slug

  scope :all_with_counts, select('project_tags.*, count(project_tag_refs.project_tag_id) as count').joins(:project_tag_refs).order('project_tags.name').group('project_tags.id')

  def to_param
    slug
  end

  def create_slug
    self.slug = name.parameterize '_'
  end
end
