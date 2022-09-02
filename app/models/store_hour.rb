class StoreHour < ApplicationRecord

  before_validation :titlelize_day
  validates :day, uniqueness: true

  scope :week_days, -> { where(day_type: 'week_day') }
  scope :holidays, -> { where(day_type: 'holiday') }

  enum day_type: {
    week_day: 1,
    holiday: 2,
    other: 3
  }

  class << self
    def active
      where(is_active: true)
    end

    def combined
      select{ |store_hour|
        binding.pry
      }
    end
  end

  def has_same_value(store_hour)
    store_hour.id < id &&
    store_hour.opening_time == opening_time &&
    store_hour.closing_time == closing_time &&
    store_hour.is_closed == is_closed
  end

  private

  def titlelize_day
    self.day = self.day.titleize
  end
end