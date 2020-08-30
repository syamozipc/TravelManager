class Public::HomesController < ApplicationController
  def top
  end

  def about
  	@user = User.find(3)
  end
end