class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def edit
  end

  def create
   @blog = Blog.new(blog_params)
   @blog.user_id = current_user.id
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '投稿しました！' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '変更しました！' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '投稿を削除しました！' }
      format.json { head :no_content }
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
    
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
end