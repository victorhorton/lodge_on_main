class AccessController < ApplicationController

  def home
    @store_hours = StoreHour.active.combined
  end

  def index
  end

  def locations

  end
end
