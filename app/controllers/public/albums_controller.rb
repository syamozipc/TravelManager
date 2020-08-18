class Public::AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :confirm, :destroy]
  def index
    @destinations = Destination.all
    if params[:destination_id]
      @title = Destination.find(params[:destination_id]).place + "のアルバム一覧"
      @albums = Album.where(destination_id: params[:destination_id]).publicly_open.recently_updated.page(params[:page]).per(15)
    elsif params[:choice] == "follow"
      @title = "フォロー中ユーザーのアルバム一覧"
      @albums = []
      current_user.followings.each do |user|
        albums = user.albums.publicly_open
        @albums.concat(albums)
      end
      @albums.sort_by!{|album| album.updated_at}.reverse!
      @albums = Kaminari.paginate_array(@albums).page(params[:page]).per(15)

    elsif params[:choice] == "like"
      @title = "いいねしたアルバム一覧"
      @albums = current_user.liked_albums.publicly_open.recently_updated.page(params[:page]).per(15)
    else
      @title = "アルバム一覧"
      @albums = Album.publicly_open.recently_updated.page(params[:page]).per(15)
    end
  end

  def ranking
    @destinations = Destination.all
    if params[:destination_id]
      destination = Destination.find(params[:destination_id])
      @title = destination.place + "のいいねランキング"
      albums = Album.find(Like.group(:album_id).order('count(album_id)desc').limit(5).pluck(:album_id))
      continental_albums = albums.select{|album| album.destination_id == destination.id}
      @ranked_albums = continental_albums.select{|album| album.range == "open"}
    else
      @title = "いいねランキング"
      albums = Album.find(Like.group(:album_id).order('count(album_id)desc').limit(10).pluck(:album_id))
      @ranked_albums = albums.select{|album| album.range == "open"}
    end
  end

  def show
    flash[:notice] = "ログイン済ユーザーのみアルバムにいいね・コメントできます" unless user_signed_in?
    @album = Album.find(params[:id])
    @photos = @album.photos.page(params[:photos_page]).per(40)
    @user = @album.user
    @comments = @album.comments.page(params[:comments_page]).per(10)
    @comment = Comment.new
  end

  def new
    @album = Album.new
    @album.photos.build
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      photo = params[:photos_attributes]
      if photo.present?
          photo[:"0"][:image].each do |image|
            @album.photos.create!(image: image)
          end
      end
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    if @album.user != current_user
      redirect_to user_path(current_user)
    end
    @album.photos.build
    @photos = Photo.where(album_id: params[:id]).page(params[:page]).per(40)
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      photo = params[:photos_attributes]
      if photo.present?
          photo[:"0"][:image].each do |image|
            @album.photos.create!(image: image)
          end
      end
      redirect_to album_path(@album)
    else
      @photos = Photo.where(album_id: params[:id]).page(params[:page]).per(40)
      render :edit
    end
  end

  def confirm
    @album = Album.find_by(id: params[:album_id])
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to user_path(current_user), notice: "アルバムを削除しました"
  end

  private
  def album_params
  params.require(:album).permit(:user_id, :destination_id, :title, :discription, :range)
  end
end
