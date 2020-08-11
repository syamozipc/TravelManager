class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  	@inquiries = Inquiry.where(deal: "backlog")
  end
end