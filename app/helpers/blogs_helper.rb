module BlogsHelper
  def recent_blog_posts
    posts = Blog.published.limit(3)
    render partial: 'blogs/sidebar', object: posts
  end
end
