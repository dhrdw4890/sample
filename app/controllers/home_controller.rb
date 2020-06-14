class HomeController < ApplicationController
  def top
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def about
  end
end
