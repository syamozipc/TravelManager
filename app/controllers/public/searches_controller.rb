class Public::SearchesController < ApplicationController
  def index
    @word = params[:word]
    @users = User.where('name LIKE ?', "%#{@word}%")
    @albums = Album.where('title LIKE ? or discription LIKE ?', "%#{@word}%", "%#{@word}%")
  end
end
