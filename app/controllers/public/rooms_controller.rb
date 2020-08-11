class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params.merge(room_id: @room.id))
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.page(params[:page]).per(30)
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to request.referrer
    end
  end

  def index
    currentEntries = current_user.entries
    myRoomIds = []
    currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?', current_user.id)
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end
end
