class Public::AlbumsController < ApplicationController
  def index
    @destinations = Destination.all
    if params[:destination_id]
      @destination = @destinations.find(params[:destination_id])
      @albums = Album.where(range: "open", destination_id: params[:destination_id]) #公開
    elsif params[:choice] == "follow"
      @users = current_user.followings
    elsif params[:choice] == "like"
    else
      @albums = Album.where(range: "open")
    end
  end

  def show
    @album = Album.find(params[:id])
    @comment = Comment.new
  end

  def new
    @album = Album.new
    @album.photos.build
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.save
    photo = params[:photos_attributes]
    if photo.present?
        photo[:"0"][:image].each do |image|
          @album.photos.create!(image: image)
        end
    end
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:id])
    @album.photos.build
    @photos = Photo.where(album_id: params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    photo = params[:photos_attributes]
    if photo.present?
        photo[:"0"][:image].each do |image|
          @album.photos.create!(image: image)
        end
    end
    redirect_to album_path(@album)
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to user_path(current_user), notice: "アルバムを削除しました"
  end

  def confirm #アルバム削除確認画面の表示
    @album = Album.find_by(id: params[:album_id])
  end

  def ranking
    @destinations = Destination.all
    if params[:destination_id]
      @destination = @destinations.find(params[:destination_id])
      @ranks = @destination.album.find(Like.group(:album_id).order('count(album_id)desc').limit(10).pluck(:album_id))
    else
      @ranks = Album.find(Like.group(:album_id).order('count(album_id)desc').limit(10).pluck(:album_id))
    end
  end

  private
  def album_params
  params.require(:album).permit(:user_id, :destination_id, :title, :discription, :range)
  end
end
