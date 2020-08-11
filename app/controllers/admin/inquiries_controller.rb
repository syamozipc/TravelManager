class Admin::InquiriesController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@inquiries = Inquiry.where(deal: "backlog").page(params[:page]).per(10)
  end

  def completed
  	@inquiries = Inquiry.where(deal: "completed").recently_updated.page(params[:page]).per(10)
  end

  def show
  	@inquiry = Inquiry.find(params[:id])
  end

  def update
  	Inquiry.find(params[:id]).update(deal: "completed")
  	redirect_to admin_inquiries_path, notice: "[対応が完了しました]"
  end
end
