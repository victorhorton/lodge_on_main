class TapsController < ApplicationController
  def index
    @beers = Tap.order(:position)
  end

  def edit
    @beer = Tap.find(params[:id])
  end

  def update
    @beer = Tap.find(params[:id])
    if @beer.update(tap_params)
      flash[:success] = "Beer Updated"
      redirect_to taps_path
    else
      flash.now[:warn] = "Beer didn't update"
      render :new 
    end
  end

  def show
    @beer = Tap.find(params[:id])
  end

  private

  def tap_params
    params.require(:tap).permit(:title, :description, :position, :in_stock)
  end
end
