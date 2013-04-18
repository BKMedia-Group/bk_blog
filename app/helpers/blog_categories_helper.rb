module BlogCategoriesHelper
  def get_blog_categories
    BlogCategory.published
  end
end
