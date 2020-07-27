class Public::AlbumsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @album = Album.new
    @album.photos.build
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.save
    params[:photos_attributes][:"0"][:image].each do |image|
      @album.photos.create!(image: image)
    end

    redirect_to albums_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  def ranking
  end

  private
  def album_params
  params.require(:album).permit(:user_id, :destination_id, :title, :discription, :range)
  end
end
