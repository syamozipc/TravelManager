class Public::PhotosController < ApplicationController
  def create
  end

  def destroy
  end

  def destroy_all
  	if params[:deletes]
	  checked_data = params[:deletes].keys
	  Photo.destroy(checked_data)
	  redirect_to request.referrer
	else
	  Photo.where(album_id: params[:album_id]).destroy_all
	  redirect_to request.referrer
	end
  end
end
