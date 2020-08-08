class Public::CommentsController < ApplicationController
  def create
  	album = Album.find(params[:album_id])
  	comment = current_user.comments.new(comment_params)
  	comment.album_id = album.id
  	comment.save
    @comments = album.comments.recently_updated
  end

  def destroy
    album = Album.find(params[:album_id])
    @comments = album.comments.recently_updated
    @comments.find(params[:id]).destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:user_id, :album_id, :content)
  end
end
