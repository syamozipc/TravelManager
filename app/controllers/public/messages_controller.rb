class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params.merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージは1-300字以内でお送りください"
    end
    redirect_to room_path(@message.room)
  end

  private
  def message_params
  	params.require(:message).permit(:user_id, :content, :room_id)
  end
end
