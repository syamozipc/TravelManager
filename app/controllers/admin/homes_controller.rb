class Admin::HomesController < ApplicationController
  def top
  	@inquiries = Inquiry.where(deal: "backlog")
  end
end
