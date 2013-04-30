class BlogTagsController < ApplicationController
  respond_to :json
  def index
    @tags = BlogTag.all
    respond_with @tags
  end
  def show
    @tag = BlogTag.find_by_slug! params[:id]
    @blogs = @tag.blogs
  end
end
