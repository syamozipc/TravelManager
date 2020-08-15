class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
  	@album = Album.find(params[:album_id])
  	like = current_user.likes.new(album_id: @album.id)
  	like.save
    @album.create_notification_like!(current_user)
  end

  def destroy
  	@album = Album.find(params[:album_id])
  	like = current_user.likes.find_by(album_id: @album.id)
  	like.destroy
  end
end
