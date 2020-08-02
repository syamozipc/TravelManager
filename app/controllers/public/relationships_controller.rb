class Public::RelationshipsController < ApplicationController
  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
  	follow.save
  	redirect_to request.referrer
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  	follow.destroy
  	redirect_to request.referrer
  end
end
