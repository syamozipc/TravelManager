class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@album = Album.find(params[:album_id])
  	@comment = current_user.comments.new(comment_params)
  	@comment.album_id = @album.id
  	if @comment.save
      @comments = @album.comments.page(params[:comments_page]).per(10)
      @album.create_notification_comment!(current_user, @comment.id)
    else
      @photos = @album.photos.page(params[:page]).per(40)
      @user = @album.user
      @comments = @album.comments.rpage(params[:comments_page]).per(10)
      render 'public/albums/show'
    end
  end

  def destroy
    album = Album.find(params[:album_id])
    @comments = album.comments.page(params[:comments_page]).per(10)
    @comments.find(params[:id]).destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:user_id, :album_id, :content)
  end
end
