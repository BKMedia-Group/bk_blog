module BlogTagsHelper
  def tag_list
    BlogTag.all_with_counts
  end
end
