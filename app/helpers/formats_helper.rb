module FormatsHelper
  def week_day(date)
    date.strftime("%a")
  end

  def readable_date(date)
    "#{date.strftime("%B")} #{date.day.ordinalize}"
  end

  def format_time(time)
    "#{time.strftime("%I")}:#{time.strftime("%M")} #{time.strftime("%p")}"
  end  
end