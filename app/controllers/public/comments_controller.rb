class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@album = Album.find(params[:album_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.album_id = @album.id
  	if @comment.save
      @comments = @album.comments.recently_updated
    else
      @user = @album.user
      @comments = @album.comments.recently_updated
      render 'public/albums/show'
    end
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
