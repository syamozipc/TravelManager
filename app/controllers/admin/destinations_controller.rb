class Admin::DestinationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @destinations = Destination.all
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
  	  redirect_to request.referrer
    else
      @destinations = Destination.all
      render :index
    end
  end

  def edit
  	@destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
  	@destination.update(destination_params) ? (redirect_to admin_destinations_path) : (render :edit)
  end

  def destroy
  	destination = Destination.find(params[:id]).destroy
  	redirect_to admin_destinations_path
  end

  private
  def destination_params
  	params.require(:destination).permit(:place)
  end
end
