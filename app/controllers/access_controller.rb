class AccessController < ApplicationController

  def error_404
    render status: 404
  end

  def home
    @store_hours = StoreHour.active.week_days.group_by{ |store_hour| [store_hour.opening_time, store_hour.closing_time, store_hour.is_closed]}
    @holiday_hours = StoreHour.active.holidays
  end

  def index
  end

  def locations

  end

  private

  def combined(array)
    index_array = []
    combined_objects = []

    array.each_with_index do |store_hour, idx|

      next_store_hour = array[idx + 1]

      if store_hour.opening_time == next_store_hour.opening_time &&
        store_hour.closing_time == next_store_hour.closing_time &&
        store_hour.is_closed == next_store_hour.is_closed

        binding.pry
      else
        binding.pry
      end
    end
  end
end
