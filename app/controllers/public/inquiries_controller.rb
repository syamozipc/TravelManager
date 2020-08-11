class Public::InquiriesController < ApplicationController
  before_action :authenticate_user!
  def new
	@inquiry = Inquiry.new
  end

  def confirm
	@inquiry = Inquiry.new(inquiry_params)
  end

  def create
	@inquiry = current_user.inquiries.new(inquiry_params)
	@inquiry.deal = "backlog"
	if params[:back]
		render :new
	elsif @inquiry.save
		redirect_to inquiry_path(@inquiry)
	else
		render :new
	end
  end

  def show
	@inquiry = Inquiry.find(params[:id])
  end

  private
  def inquiry_params
	params.require(:inquiry).permit(:title, :content)
  end
end
