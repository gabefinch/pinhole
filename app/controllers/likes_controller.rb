class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.save
    redirect_to :back
  end


private
  def like_params
    params.require(:like).permit(:book_id)
  end
end
