class PostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:update, :destroy]
  
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to posts_url
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    if @post.update_attributes(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to("/posts")
    else
      render "edit"
    end  
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to("/posts")
  end

  private

    def post_params
      params.require(:post).permit(:content, :image, :answer)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
