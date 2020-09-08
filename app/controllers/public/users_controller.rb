class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :unsubscribe, :withdraw]
  before_action :check_guest, only: [:withdraw, :update]
  def show
    @user = User.find(params[:id])
    if @user == current_user
      @albums = @user.albums.recently_updated.page(params[:page]).per(15)
    else
      @albums = @user.albums.publicly_open.recently_updated.page(params[:page]).per(15)
    end

    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      if @user.id != current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom != true
          @room = Room.new
          @entry = Entry.new
        end
      end
      end
    end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, success: '変更を保存しました'
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def unsubscribe
  end

  def withdraw
    current_user.update(is_active: false)
    current_user.albums.destroy_all
    reset_session
    redirect_to root_path, success: '退会が完了しました。ご愛顧いただき、ありがとうございました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end
end
