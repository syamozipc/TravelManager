class Public::LikesController < ApplicationController
  def create
  	album = Album.find(params[:album_id])
  	like = current_user.likes.new(album_id: album.id)
  	like.save
  	redirect_to request.referrer
  end

  def destroy
  	album = Album.find(params[:album_id])
  	like = current_user.likes.find_by(album_id: album.id)
  	like.destroy
  	redirect_to request.referrer
  end
end
