class StoreHour < ApplicationRecord

  before_validation :titlelize_day
  validates :day, uniqueness: true

  scope :combined, -> { group_by{|a| [a.opening_time, a.closing_time]}.map{|a| binding.pry } }

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