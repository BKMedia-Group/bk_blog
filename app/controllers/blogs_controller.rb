class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def manage
    @blogs = Blog.paginate(page: params[:page], per_page: 50)
  end
  def new
    @blog = current_user.blogs.build
  end
  def create
    @blog = Blog.new blog_params
    if @blog.save
      flash[:success] = "Blog created"
      redirect_to manage_blogs_path
    else
      render :new
    end
  end
  def edit
    @blog = Blog.find_by_slug params[:id]
  end
  def update
    @blog = Blog.find_by_slug params[:id]
    if @blog.update_attributes blog_params
      flash[:success] = 'Blog Updated'
      redirect_to manage_blogs_path
    else
      render :edit
    end
  end
  def destroy
    blog = Blog.find_by_slug params[:id]
    blog.destroy
    flash[:success] = 'Blog destroyed'
    redirect_to manage_blogs_path
  end
  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 10)
  end
  def show
    @blog = Blog.find_by_slug params[:id]
  end

  private

  def blog_params
    params.require(:blog).permit :full_text, :intro_text, :title, :user_id, :created_at, :published, :image, :slug,
                                 :blog_category_id, :tag_list, {:blog_attachments_attributes => [:file, :title, :id]}
  end
end
