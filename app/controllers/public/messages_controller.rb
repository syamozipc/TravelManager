class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params.merge(user_id: current_user.id))
      @messages = @message.room.messages.recently_updated.page(params[:page]).per(15)
    else
      flash[:alert] = "メッセージは1-300字以内でお送りください"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    @messages = @message.room.messages.recently_updated.page(params[:page]).per(15)
  end

  private
  def message_params
  	params.require(:message).permit(:user_id, :content, :room_id)
  end
end
