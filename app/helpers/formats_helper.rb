module FormatsHelper

  def shorten_date(day)
    case day
    when 'Monday'
      'Mon'
    when 'Tuesday'
      'Tues'
    when 'Wednesday'
      'Wed'
    when 'Thursday'
      'Thur'
    when 'Friday'
      'Fri'
    when 'Saturday'
      'Sat'
    when 'Sunday'
      'Sun'
    else
      'Incorrect Date'
    end
  end

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