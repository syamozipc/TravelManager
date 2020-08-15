class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
  	follow.save
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  	follow.destroy
    @user = User.find(params[:user_id])
  end
end
