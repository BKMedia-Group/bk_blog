class BlogsController < ApplicationController

  include SessionsHelper

  before_filter :is_admin, except: [:index, :show]

  def manage
    @blogs = Blog.all
  end
  def new
    @blog = current_user.blogs.build
  end
  def create
    @blog = Blog.new params[:blog]
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
    if @blog.update_attributes params[:blog]
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
    @blogs = Blog.published
  end
  def show
    @blog = Blog.find_by_slug params[:id]
  end

  private
    def is_admin
      redirect_to signin_path, error: "You are not authorized to do this" unless is_admin?
    end


  # these will be deleted
  #def el_mercado_caliente
  #
  #end
  #def the_biggest_beef_exporter_on_earth
  #end
  #
  #def the_protein_markets_of_the_future
  #end
  #
  #def ractopamine_export_restrictions
  #end

end
