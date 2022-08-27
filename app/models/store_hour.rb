class StoreHour < ApplicationRecord

  before_validation :titlelize_day
  validates :day, uniqueness: true

  scope :week_days, -> { where(day_type: 'week_day') }
  scope :holidays, -> { where(day_type: 'holiday') }

  scope :combined, -> { group_by{
    |a| [a.opening_time, a.closing_time, a.is_closed]
  }.map do |a|
    if a[0][2] == true
      {opening_time: a[0][0], closing_time: a[0][1], days: ["#{a[1].first.day}"], is_closed: a[0][2]}
    elsif a[1].length < 2
      {opening_time: a[0][0], closing_time: a[0][1], days: ["#{a[1].first.day}"], is_closed: a[0][2]}
    else
      {opening_time: a[0][0], closing_time: a[0][1], days: ["#{a[1].first.day}", "#{a[1].last.day}"], is_closed: a[0][2]}
    end
  end
  }

  enum day_type: {
    week_day: 1,
    holiday: 2,
    other: 3
  }

  class << self
    def active
      where(is_active: true)
    end
  end

  private

  def titlelize_day
    self.day = self.day.titleize
  end
end