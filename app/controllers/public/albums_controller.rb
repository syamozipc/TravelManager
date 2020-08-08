class Public::AlbumsController < ApplicationController
  def index
    @destinations = Destination.all
    if params[:destination_id]
      @title = Destination.find(params[:destination_id]).place + "のアルバム一覧"
      @albums = Album.where(destination_id: params[:destination_id]).publicly_open.recently_updated
    elsif params[:choice] == "follow"
      @title = "フォロー中ユーザーのアルバム一覧"
      @albums = []
      current_user.followings.each do |user|
        albums = user.albums.publicly_open
        @albums.concat(albums)
      end
      @albums.sort_by!{|album| album.updated_at}.reverse!

    elsif params[:choice] == "like"
      @title = "いいねしたアルバム一覧"
      @albums = current_user.liked_albums.publicly_open.recently_updated
    else
      @title = "アルバム一覧"
      @albums = Album.publicly_open.recently_updated
    end
  end

  def ranking
    @destinations = Destination.all
    if params[:destination_id]
      @title = Destination.find(params[:destination_id]).place + "のいいねランキング"
      @albums = Destination.find(params[:destination_id]).albums.where(id: Like.group(:album_id).order('count(album_id)desc').limit(10).pluck(:album_id))
    else
      @title = "いいねランキング"
      @albums = Album.find(Like.group(:album_id).order('count(album_id)desc').limit(10).pluck(:album_id))
    end
  end

  def show
    @album = Album.find(params[:id])
    @user = @album.user
    @comments = @album.comments.recently_updated
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

  def confirm
    @album = Album.find_by(id: params[:album_id])
  end

  private
  def album_params
  params.require(:album).permit(:user_id, :destination_id, :title, :discription, :range)
  end
end
