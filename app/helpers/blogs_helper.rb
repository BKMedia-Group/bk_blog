module BlogsHelper
  def recent_blog_posts
    posts = Blog.published.limit(3)
    render partial: 'blogs/small', collection: posts
  end
end
