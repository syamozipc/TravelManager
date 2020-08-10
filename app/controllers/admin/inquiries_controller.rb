class Admin::InquiriesController < ApplicationController
  def index
  	@inquiries = Inquiry.where(deal: "backlog")
  end

  def completed
  	@inquiries = Inquiry.where(deal: "completed").recently_updated
  end

  def show
  	@inquiry = Inquiry.find(params[:id])
  end

  def update
  	Inquiry.find(params[:id]).update(deal: "completed")
  	redirect_to admin_inquiries_path
  end
end
