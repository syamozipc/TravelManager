class Public::CommentsController < ApplicationController
  def create
  	album = Album.find(params[:album_id])
  	comment = current_user.comments.new(comment_params)
  	comment.album_id = album.id
  	comment.save
  	redirect_to request.referrer
  end

  def destroy
    Album.find(params[:album_id]).comments.find(params[:id]).destroy
    redirect_to request.referrer
  end

  private
  def comment_params
  	params.require(:comment).permit(:user_id, :album_id, :content)
  end
end
