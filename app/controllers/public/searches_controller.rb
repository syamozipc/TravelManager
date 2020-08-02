class Public::SearchesController < ApplicationController

  def index
    @word = params[:word]
    @users = search_user(@word)
    @albums = search_album(@word)
  end

  private
  def search_user(word)
    User.where('name LIKE ?', "%#{word}%")
  end

  def search_album(word)
    Album.where('title LIKE ? or discription LIKE ?', "%#{word}%", "%#{word}%")
  end
end
