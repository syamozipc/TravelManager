class Public::HomesController < ApplicationController
  def top
  end

  def about
  	@user = User.find(4)
  end
end