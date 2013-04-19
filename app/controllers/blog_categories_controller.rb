class BlogCategoriesController < ApplicationController
  include SessionsHelper
  before_filter :is_admin, except: [:show, :index]
  def index
    @categories = BlogCategory.greedy
  end

  def show
    @category = BlogCategory.find_by_slug params[:id]
    @blogs = @category.blogs.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = BlogCategory.new
  end

  def create
    @category = BlogCategory.new params[:blog_category]
    if @category.save
      flash[:success] = 'Cateogry Created'
      redirect_to manage_blog_categories_path
    else
      render :new
    end
  end

  def edit
    @category = BlogCategory.find_by_slug params[:id]
  end

  def update
    @category = BlogCategory.find_by_slug params[:id]
    if @category.update_attributes params[:blog_category]
      flash[:success] = 'Cateogry Updated'
      redirect_to manage_blog_categories_path
    else
      render :edit
    end
  end

  def manage
    @categories = BlogCategory.all
  end

  def destroy
    category = BlogCategory.find_by_slug params[:id]
    category.destroy
    flash[:success] = 'Category Destroyed'
    redirect_to manage_blog_categories_path
  end

  private
    def is_admin
      redirect_to signin_path, error: "You are not authorized to do this" unless is_admin?
    end
end
