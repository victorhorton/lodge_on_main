class AccessController < ApplicationController

  def home
    @store_hours = StoreHour.active.week_days.combined
    @holiday_hours = StoreHour.active.holidays.combined
  end

  def index
  end

  def locations

  end
end
