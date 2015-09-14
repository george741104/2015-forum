class PostsController < ApplicationController
  before_action :set_post, only:[:show]
  before_action
  before_action
  helper_method :sort_column, :sort_direction
  def index
    @posts = Post.order(sort_column+' '+sort_direction)

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    #@post.user = current_user
    @post.save
    redirect_to posts_path
  end

  def show

  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy

    flash[:alert] = "post was deleted"
    redirect_to :back

  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_ids => [])
  end

private
  def set_post
    @post = Post.find(params[:id])
  end
# default order setting below===========================================
  def sort_direction
    ["asc","desc"].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    Post.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
end
