class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @albums = @user.albums
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
      redirect_to @user
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
    @users= user.followers
  end

  def unsubscribe
  end

  def withdraw #論理削除
    current_user.update(is_active: false)
    current_user.albums.destroy_all
    reset_session
    flash[:notice] = "ご愛顧いただき、ありがとうございました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :email)
  end
end
