class HomeController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(5)
  end

  def about
  end
end
