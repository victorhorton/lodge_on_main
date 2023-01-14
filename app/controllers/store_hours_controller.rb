class StoreHoursController < ApplicationController  

  before_action :confirm_logged_in

  def index
    @store_hours = StoreHour.all
  end

  def create
    @store_hour = StoreHour.new(store_hours_params)
    if @store_hour.save
      flash[:success] = "Hours Saved"
      redirect_to root_path
    else
      flash.now[:warn] = "Hours didn't save"
      render :new 
    end
  end

  def new
    @store_hour = StoreHour.new
  end

  def edit
    @store_types = StoreHour.day_types.keys.select{|key| key != 'week_day'}.map{|key| key.titleize}
    @store_hour = StoreHour.find(params[:id])
  end

  def update
    @store_types = StoreHour.day_types.keys.select{|key| key != 'week_day'}.map{|key| key.titleize}
    @store_hour = StoreHour.find(params[:id])
    if @store_hour.update(store_hours_params)
      flash[:success] = "Hours Updated"
      redirect_to root_path
    else
      flash.now[:warn] = "Hours didn't update"
      render :new 
    end
  end

  private

  def store_hours_params
    params.require(:store_hour).permit(:day, :day_type, :opening_time, :closing_time, :is_active)
  end
end
