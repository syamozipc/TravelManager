class Public::PhotosController < ApplicationController
  before_action :authenticate_user!
  def destroy_all
  	if params[:deletes]
	  checked_data = params[:deletes].keys
	  Photo.destroy(checked_data)
	  redirect_to request.referrer, success: '写真を削除しました'
	elsif params[:select] == "all"
	  Photo.where(album_id: params[:album_id]).destroy_all
	  redirect_to request.referrer, success: '写真を削除しました'
	end
  end
end
