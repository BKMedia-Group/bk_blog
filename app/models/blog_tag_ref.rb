class BlogTagRef < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :blog
  belongs_to :blog_tag
end
