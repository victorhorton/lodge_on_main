class TapsController < ApplicationController
  def index
    @beers = Tap.order(:position)
  end

  def edit
    @beer = Tap.find(params[:id])
  end

  def update
    @beer = Tap.find(params[:id])
    @beer.update(tap_params)
  end

  def show
    @beer = Tap.find(params[:id])
  end

  private

  def tap_params
    params.require(:tap).permit(:title, :descritption, :position, :in_stock)
  end
end
