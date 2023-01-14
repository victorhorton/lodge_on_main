days_of_the_week = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
]

7.times do |idx|
    StoreHour.create(
        day_type: 'week_day',
        day: days_of_the_week[idx], 
        opening_time: '09:00:00',
        closing_time: '22:00:00',
        is_closed: false,
        is_active: true
    )
end

16.times do |idx|
    Tap.create(
        position: idx + 1,
        title: "Example #{idx + 1}"
    )
end

