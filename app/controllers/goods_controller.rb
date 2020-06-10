class GoodsController < ApplicationController

  def create
    @good = Good.new(user_id: current_user.id,
                     post_id: params[:post_id])
    @good.save
    redirect_back(fallback_location: posts_url)
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id,
                          post_id: params[:post_id])
    @good.destroy
    redirect_back(fallback_location: posts_url)
  end
end